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
	pass
