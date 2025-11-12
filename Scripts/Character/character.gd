class_name Character
extends CharacterBody2D

signal damage_taken(direction: Vector2)
signal health_changed

@export var current_hp : int = 10
@export var max_hp : int = 10
@export var move_speed : float = 30
@export var force_drag : float = 5
@export var weight : float = 1

var move_input: Vector2
var look_direction: Vector2
var external_force:  Vector2

func _physics_process(delta: float) -> void:
	_move(delta)
	

func take_damage(amount: int, force: Vector2) -> void:
	current_hp -= amount
	add_force(force)
	
	if current_hp <= 0:
		die()
	else:
		damage_taken.emit(force)
		health_changed.emit()

func die() -> void:
	pass


func heal(amount: int) -> void:
	pass
	
	
func add_force(force: Vector2) -> void:
	# the heavier the character, the less force is applied to it
	external_force += force / weight
	
	
func _move(delta: float) -> void:
	external_force = external_force.lerp(Vector2.ZERO, force_drag * delta)
	
	velocity = move_input * move_speed
	velocity += external_force
	move_and_slide()
	
	
	
	
	
	
