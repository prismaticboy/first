extends interactable

class_name teleporter

export(String,FILE,"*.tscn") var target_path:String

func _interact():
	._interact()
	get_tree().change_scene(target_path)

