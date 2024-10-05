extends interactable

class_name teleporter

export(String,FILE,"*.tscn") var target_path:String

var tween_stylebox:StyleBoxFlat

onready var button_sound = $"../button_sound"
onready var panel = $Panel
onready var tween = $"../Tween"


func _interact():
	._interact()
	get_tree().change_scene(target_path)



func _on_teleporter_mouse_entered():
	button_sound.play(0.05)
	tween.interpolate_property(panel,"custom_styles/panel:shadow_color",
	Color(0,0,0,0.6),Color(1,1,1,0.6),0.2,Tween.EASE_IN)
	tween.start()
	pass # Replace with function body.


func _on_teleporter_mouse_exited():
	tween.interpolate_property(panel,"custom_styles/panel:shadow_color",
	null,Color(0,0,0,0.6),0.2,Tween.EASE_OUT)
	tween.start()
	pass # Replace with function body.
	
