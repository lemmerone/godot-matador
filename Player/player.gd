extends CharacterBody3D

var speed = 10
var acceleration = 5
var direction = Vector3()
var velo = Vector3()

var radius = 2 * PI / 6

func _process(delta):
	if Input.is_action_just_pressed("rotation_left"):
		rotate_y(radius)
	if Input.is_action_just_pressed("rotation_right"):
		rotate_y(-radius)
