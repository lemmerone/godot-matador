extends CharacterBody3D

var wall = 6
var direction = 0.0
const SMOOTH_SPEED = 5.0

func _get_spacing(wall):
	return 2 * PI / wall
	
func _process(delta):
	if (Input.is_action_just_pressed("rotation_right")):
		direction -= _get_spacing(wall)
	if (Input.is_action_just_pressed("rotation_left")):
		direction += _get_spacing(wall)
	
	rotation.y = lerp_angle(rotation.y, direction, delta * SMOOTH_SPEED)
