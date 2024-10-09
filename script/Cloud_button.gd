extends Sprite

export(String) var label_name 

func _ready():
	$Label.text = label_name
