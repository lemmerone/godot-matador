extends CharacterBody3D

var wall = 6
var step = 2
var step_rotation = 0.0
const SMOOTH_SPEED = 5.0
var direction

func _get_spacing(wall):
	return 2 * PI / wall
	
func _process(delta):
	if (Input.is_action_just_pressed("rotation_right")):
		step_rotation -= _get_spacing(wall)
	if (Input.is_action_just_pressed("rotation_left")):
		step_rotation += _get_spacing(wall)
	if (Input.is_action_just_pressed("move_left")):
		direction = (transform.basis * Vector3(1, 0, 0)).normalized()
	if (Input.is_action_just_released("move_left")):
		direction = (transform.basis * Vector3(0, 0, 0)).normalized()
		
	if direction:
		position.x = direction.x * step
		position.z = direction.z * step
	else:
		position.x = move_toward(0, 0, step)
		position.z = move_toward(0, 0, step)
	rotation.y = lerp_angle(rotation.y, step_rotation, delta * SMOOTH_SPEED)
