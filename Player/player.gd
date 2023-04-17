extends CharacterBody3D

var wall = 7
var step_rotation = 0.0
var direction

const SMOOTH_SPEED = 5.0
const DODGE_SPEED = 2

func direction_zero():
	direction = (transform.basis * Vector3.ZERO).normalized()

func _get_spacing(wall):
	return 2 * PI / wall
	
func _process(delta):
	if (Input.is_action_just_pressed("rotation_right")):
		step_rotation -= _get_spacing(wall)
		direction_zero()
	elif (Input.is_action_just_pressed("rotation_left")):
		step_rotation += _get_spacing(wall)
		direction_zero()
	elif (Input.is_action_just_pressed("dodge")):
		direction = (transform.basis * Vector3.RIGHT).normalized()
	elif (Input.is_action_just_released("dodge")):
		direction_zero()
		
	if direction:
		position.x = direction.x * DODGE_SPEED
		position.z = direction.z * DODGE_SPEED
	else:
		position.x = move_toward(0, 0, DODGE_SPEED)
		position.z = move_toward(0, 0, DODGE_SPEED)
		
	rotation.y = lerp_angle(rotation.y, step_rotation, delta * SMOOTH_SPEED)
