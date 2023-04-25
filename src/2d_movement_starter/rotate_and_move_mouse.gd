extends CharacterBody2D

@export var speed = 400

func get_input():
	look_at(get_global_mouse_position())
	velocity = transform.x * Input.get_axis("down", "up") * speed
	
func _physics_process(delta):
	get_input()
	move_and_slide()
