class_name CharacterVisual
extends Sprite2D

@export var character: Character
@export var wobble_speed: float = 15
@export var wobble_amount: float = 5


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	flip_h = character.look_direction.x < 0
	
	# rotate when moving
	var target_rotation: float = 0
	if character.velocity.length() > 1:
		var time = Time.get_unix_time_from_system()
		target_rotation = sin(time * wobble_speed) * wobble_amount
	
	rotation_degrees = lerpf(rotation_degrees, target_rotation, delta * 20)
	
	
