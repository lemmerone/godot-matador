extends CharacterBody3D

signal hit

@onready var health = 2
var num_sides : int
var step_rotation : float
var direction

const SMOOTH_SPEED = 5.0
const DODGE_SPEED = 3

func _ready():
	$HUD/Label.text = var_to_str(health)

func get_num_sides():
	return num_sides

func set_num_sides(count):
	num_sides = count

func direction_zero():
	direction = (transform.basis * Vector3.ZERO).normalized()

func _get_spacing(count):
	return 2 * PI / count

func _process(delta):
	if (Input.is_action_just_pressed("rotation_right")):
		step_rotation -= _get_spacing(num_sides)
		direction_zero()
	elif (Input.is_action_just_pressed("rotation_left")):
		step_rotation += _get_spacing(num_sides)
		direction_zero()
	elif (Input.is_action_just_pressed("dodge")):
		direction = (transform.basis * Vector3.RIGHT).normalized()
	elif (Input.is_action_just_released("dodge")):
		direction_zero()
		
	if direction:
		position.x = lerp_angle(position.x, direction.x * DODGE_SPEED, delta * SMOOTH_SPEED)
		position.z = lerp_angle(position.z, direction.z * DODGE_SPEED, delta * SMOOTH_SPEED)
	else:
		position.x = lerp_angle(position.x, 0, delta * SMOOTH_SPEED)
		position.z = lerp_angle(position.z, 0, delta * SMOOTH_SPEED)
		
	rotation.y = lerp_angle(rotation.y, step_rotation, delta * SMOOTH_SPEED)

func die():
	hit.emit()
	queue_free()

func _on_mob_detector_body_entered(body):
		damage()

func damage():
	health -= 1
	$HUD/Label.text = var_to_str(health)
	if health == 0:
		die()
