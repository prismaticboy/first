extends KinematicBody2D

onready var animated_sprite = $AnimatedSprite

var directer = Vector2.ZERO
export var speed  = 120
var flip_x = false
var flip_y = false
var char_angle = 0

func _ready():
	pass
	
func _physics_process(delta):
	var mouse_position = get_global_mouse_position()
	var self_position  = self.position
	
	directer = (mouse_position-self_position).normalized()
	
	char_angle = 57.29*directer.angle()
	print(char_angle)
	directer = directer*speed
	
	move_and_slide(directer,Vector2.ZERO)
	
func _process(delta):
	if char_angle >= -45 and char_angle < 45:
		animated_sprite.play("right")
		
	elif char_angle >= 45 and char_angle < 135:
		animated_sprite.play("down")
		
	elif char_angle >= 135 or char_angle < -135:
		animated_sprite.play("left")
		
	elif char_angle >= -135 and char_angle < -45:
		animated_sprite.play("up")

	
