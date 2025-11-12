class_name RangedWeapon
extends Weapon

@export var projectile_scene: PackedScene

@onready var muzzle: Node2D = $Muzzle

func use() -> void:
	var projectile = projectile_scene.instantiate()
	get_tree().root.get_node("/root/Main").add_child(projectile)
	projectile.global_position = muzzle.global_position
	projectile.global_rotation = global_rotation
	
	projectile.initialize(owner_character)
