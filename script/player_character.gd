extends KinematicBody2D

onready var animated_sprite = $AnimatedSprite

var directer = Vector2.ZERO
export var speed  = 150
var animation = ["down","left","up","default"]
var code_num = 0
var flip_x = false
var flip_y = false
var can_move = true
var stop = false
var char_angle = 0

func _ready():
	choose_player("Actor1",1)
	pass
	
func choose_player(type:String,code:int):
	var player_path:String = "res://assert/image/character/animation/MZ Characters/"
	
	animated_sprite.frames.clear_all()
	
	var sprite_frames_custou = SpriteFrames.new()
	
#	初始化aniamtiedsprite
	for i in range(3):
		sprite_frames_custou.add_animation(animation[i])
		sprite_frames_custou.set_animation_loop(animation[i],true)
		sprite_frames_custou.set_animation_speed(animation[i],11)
	
#	加载图片
	var texture_size = Vector2(576,384)
	var sprite_size = Vector2(48,48)
	var full_texture:Texture = load(player_path+type+".png")
	
#	切割图片
	var num_colums = int(texture_size.x/sprite_size.x)
	var num_row = int(texture_size.y/sprite_size.y)
	var coluns = int(num_colums/4)*int(code%4)
	var row = int(num_row/2)*int(code/5)
	
#	添加帧动画
	var animation_num:int=0
	for y in range(row,(row+4)):
		
		for x in range(coluns,(coluns+3)):
			var frame = AtlasTexture.new()
			frame.atlas = full_texture
			frame.region = Rect2(Vector2(x,y)*sprite_size,sprite_size)
			sprite_frames_custou.add_frame(animation[animation_num],frame)
		animation_num+=1	
	animated_sprite.frames = sprite_frames_custou
	
	

func _physics_process(delta):
	var mouse_position = get_global_mouse_position()
	var self_position  = self.position
	
	directer = (mouse_position-self_position).normalized()
	
	char_angle = 57.29*directer.angle()
	
	directer = directer*speed
	if can_move and !stop:
		move_and_slide(directer,Vector2.ZERO)
	
func _process(delta):
	if char_angle >= -45 and char_angle < 45:
		animated_sprite.play("up")
		
	elif char_angle >= 45 and char_angle < 135:
		animated_sprite.play("down")
		
	elif char_angle >= 135 or char_angle < -135:
		animated_sprite.play("left")
		
	elif char_angle >= -135 and char_angle < -45:
		animated_sprite.play("default")
func _input(event):
	if event.is_action_pressed("interact"):
		can_move = false
	if event.is_action_released("interact"):
		can_move = true


func _on_stop_mouse_entered():
	stop = true
	pass # Replace with function body.


func _on_stop_mouse_exited():
	stop = false
	pass # Replace with function body.


func _on_Button_pressed():
	if code_num>8:
		code_num=0;
	else:
		code_num+=1
		
	choose_player("Actor1",code_num)
	pass # Replace with function body.
