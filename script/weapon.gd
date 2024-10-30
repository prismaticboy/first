extends Node2D

onready var weapon_animate = $AnimatedSprite
onready var shoot_pos = $Position2D
onready var timer = $Timer
onready var bullet = preload("res://scene/bullet.tscn")

var bullet_shoot_time = 0.5
var bullet_speed = 2000
var bullet_hurt = 1

var attack_enemy = [] 

const weapon_level = {
	level_1 = "#ff0000",
	level_2 = "#00ff00",
	level_3 = "#0000ff",
	level_4 = "#ffff00",
	level_5 = "#00ffff",
	level_6 = "#ff00ff",
	level_7 = "#000000",
	level_8 = "#ffffff",
}

func _ready():
	var ran = RandomNumberGenerator.new()
	ran.randomize()
#	var materialTemp = weapon_animate.material.duplicate()
#	weapon_animate.material = materialTemp
	weapon_animate.material.set_shader_param("line_color",Color(weapon_level['level_'+str(ran.randi_range(1,8))]))


func _process(delta):
	if attack_enemy.size()!=0:
		self.look_at(attack_enemy[0].position)
	else:
		rotation_degrees = 0;

func _on_Timer_timeout():
	if attack_enemy.size()!=0:
		var now_bullet = bullet.instance()
		now_bullet.speed = bullet_speed
		now_bullet.hurt = bullet_hurt
		now_bullet.position = shoot_pos.global_position
		now_bullet.dir = (attack_enemy[0].global_position-now_bullet.position).normalized()
		get_tree().root.add_child(now_bullet)
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if body.is_in_group("enemy") and !attack_enemy.has(body):
		attack_enemy.append(body)
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	if body.is_in_group("enemy") and attack_enemy.has(body):
		attack_enemy.remove(attack_enemy.find(body))
	pass # Replace with function body.
