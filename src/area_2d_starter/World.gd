extends Node2D

var Ball = load("res://Ball.tscn")


func _draw():
	# Draw shaded regions to show the areas.
	draw_circle($Point.position, $Point/CollisionShape2D.shape.radius,
				Color(1, 1, 1, 0.1))
	var s = $Antigrav/CollisionShape2D.shape.size
	draw_rect(Rect2($Antigrav.position - (s / 2), s), Color(1, 1, 0, 0.1))
	s = $Slow/CollisionShape2D.shape.size
	draw_rect(Rect2($Slow.position - (s / 2), s), Color(0, 1, 1, 0.1))

	
func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			var b = Ball.instantiate()
			b.position = event.position
			add_child(b)
