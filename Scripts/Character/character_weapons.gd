class_name CharacterWeapons
extends Node2D

# enemies and players attack differently!

@export var weapon_to_equip: PackedScene

var current_weapon: Weapon

@onready var character: Character = $".."


func _ready() -> void:
	if weapon_to_equip:
		equip_weapon(weapon_to_equip)
	

func equip_weapon(weapon: PackedScene) -> void:
	# switch weapons
	if current_weapon:
		unequip_weapon()
	
	current_weapon = weapon.instantiate()
	add_child(current_weapon)
	current_weapon.global_position = global_position 
	current_weapon.owner_character = character
	current_weapon.equip()
	
func unequip_weapon() -> void:
	if not current_weapon:
		return
	current_weapon.unequip()
	current_weapon.queue_free()
	
