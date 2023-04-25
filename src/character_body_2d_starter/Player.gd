extends KinematicBody2D

var Bullet = preload("res://Bullet.tscn")
var speed = 200
var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('backward'):
		velocity = Vector2(-speed/3, 0).rotated(rotation)
	if Input.is_action_pressed('forward'):
		velocity = Vector2(speed, 0).rotated(rotation)
	if Input.is_action_just_pressed('mouse_click'):
		shoot()

func shoot():
	var b = Bullet.instance()
	b.start($Muzzle.global_position, rotation)
	get_parent().add_child(b)

func _physics_process(delta):
	get_input()
	var dir = get_global_mouse_position() - global_position
	if dir.length() > 5:
		rotation = dir.angle()
		velocity = move_and_slide(velocity)