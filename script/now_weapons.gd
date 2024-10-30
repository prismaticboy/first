extends Node2D

export var weapon_radious = 100
var weapon_num = 0

func _ready():
	var weapon_num = self.get_child_count()
	var unit = TAU/weapon_num
	var weapons = self.get_children()
	
	for i in len(weapons):
		var weapon = weapons[i]
		var weapon_rad = unit*i
		var end_pos = weapon.position + Vector2(weapon_radious,0).rotated(weapon_rad)
		weapon.position = end_pos
