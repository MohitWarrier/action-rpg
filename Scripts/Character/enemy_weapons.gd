class_name EnemyWeapons
extends CharacterWeapons

@onready var enemy: Enemy = $".."

func _process(delta: float) -> void:
	if not current_weapon:
		return
	
	var target_direction: Vector2 = global_position.direction_to(enemy.target.global_position)
	var target_distance: float = global_position.distance_to(enemy.target.global_position)
	
	current_weapon.set_aim_direction(target_direction)
	
	if target_distance <= current_weapon.range:
		current_weapon.try_use()
