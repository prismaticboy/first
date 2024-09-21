extends Area2D

class_name interactable

signal interact

func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed("interact"):
		_interact()
	else:
		return
		
func _input(event):
	if event is InputEventScreenTouch and event.pressed:
		_interact()
	else:
		return
		
func _interact():
	emit_signal("interact")
