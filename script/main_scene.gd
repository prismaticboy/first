extends Control
onready var click_sound = $click_sound
onready var background = $background

func _ready():
	_hook_button_sound(self)
	
func _hook_button_sound(node):
	for child in node.get_children():
		if child is Button:
			child.connect("pressed",click_sound,"play")
		else:
			_hook_button_sound(child)


func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_continue_pressed():
	
	pass # Replace with function body.
	

func _on_start_pressed():
	get_tree().change_scene("res://scene/level_base.tscn")
	pass # Replace with function body.


func _on_background_finished():
	background.play()
	pass # Replace with function body.
