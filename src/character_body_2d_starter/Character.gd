extends KinematicBody2D

var velocity = Vector2(100, 100)
var use_slide = true

func _physics_process(delta):
	if use_slide:
		velocity = move_and_slide(velocity)
	else:
		var collision = move_and_collide(velocity * delta)
		if collision:
			velocity = velocity.slide(collision.normal)
