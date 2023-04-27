extends Node

@export var Ball: PackedScene

func _input(event):
	if event.is_action_pressed("click"):
		var new_ball = Ball.instantiate()
		new_ball.position = get_viewport().get_mouse_position()
		add_child(new_ball)
