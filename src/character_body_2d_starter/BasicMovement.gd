extends KinematicBody2D

var speed = 250
var velocity = Vector2()
var use_slide = true

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	if use_slide:
		move_and_slide(velocity)
	else:
		move_and_collide(velocity * delta)