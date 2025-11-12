class_name EquipItem
extends Node2D

@export var use_rate: float = 0.5
var last_use_time: float
var aim_angle: float
var owner_character: Character
var can_use: bool = true


func _ready() -> void:
	last_use_time = Time.get_unix_time_from_system()

func _process(delta: float) -> void:
	global_rotation = lerp_angle(global_rotation, aim_angle, 40 * delta)


func set_aim_direction(aim_direction: Vector2) -> void:
	aim_angle = aim_direction.angle()
	
	
func equip() -> void:
	pass
	

func unequip() -> void:
	pass


func try_use() -> bool:
	if not can_use:
		return false
	
	# check if enough time has elapsed to use item again
	if Time.get_unix_time_from_system() - last_use_time < use_rate:
		return false
	
	last_use_time = Time.get_unix_time_from_system()
	use() 
	return true


func use() -> void:
	pass
