extends CharacterBody3D

@export var speed = 10
var border_x = 40
var border_z = 40

func _process(delta):
	if (abs(position.x) > abs(border_x)) or (abs(position.z) > abs(border_z)):
		queue_free()
	#delete on release
	if (Input.is_action_pressed("remove_mob")):
		queue_free()

func _physics_process(_delta):
	move_and_slide()

func initialize(start_position, player_position):
	look_at_from_position(start_position, Vector3.ZERO, Vector3.UP)

	velocity = Vector3.FORWARD * speed
	velocity = velocity.rotated(Vector3.UP, rotation.y)
