extends CharacterBody3D

@export var speed = 10
var border_x = 40
var border_z = 40

func _process(_delta):
	if (abs(position.x) > abs(border_x)) or (abs(position.z) > abs(border_z)):
		queue_free()

func _physics_process(_delta):
	move_and_slide()

func initialize(start_position):
	look_at_from_position(start_position, Vector3.ZERO, Vector3.UP)

	velocity = Vector3.FORWARD * speed
	velocity = velocity.rotated(Vector3.UP, rotation.y)
