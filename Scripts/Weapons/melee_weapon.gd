class_name MeleeWeapon
extends Weapon

@export var damage: int
@export var hit_force: float

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var hitbox: Area2D = $Hitbox


# overriden method
func use() -> void:
	anim.play("attack")


func detect_hits() -> void:
	for body in hitbox.get_overlapping_bodies():
		if body == owner_character:
			continue
		if body is not Character:
			continue
		
		var direction: Vector2 = global_position.direction_to(body.global_position)
		body.take_damage(damage, direction * hit_force)

		
		
