extends KinematicBody2D

var dir = Vector2.ZERO
var speed = 2000
var hurt = 1

func _physics_process(delta):
	move_and_slide(dir*speed)


func _on_Area2D_body_entered(body):
	if body.is_in_group("wall"):
		self.queue_free()
	pass # Replace with function body.
