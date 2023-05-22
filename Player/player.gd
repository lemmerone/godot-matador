extends CharacterBody3D

signal hit
signal win
signal coin

@onready var health = 2
var step_rotation : float
var direction

const SMOOTH_SPEED = 5.0
const DODGE_SPEED = 3

func _ready():
	$HUD/health.text = var_to_str(health)
	$HUD/coins.text = str(GlobalVariables.coins)

func direction_zero():
	direction = (transform.basis * Vector3.ZERO).normalized()

func _get_spacing(count):
	return 2 * PI / count

func _process(delta):
	if (Input.is_action_just_pressed("rotation_right")):
		step_rotation -= _get_spacing(GlobalVariables.sides)
		direction_zero()
		$matador2/AnimationPlayer.play("run")
	elif (Input.is_action_just_pressed("rotation_left")):
		step_rotation += _get_spacing(GlobalVariables.sides)
		direction_zero()
		$matador2/AnimationPlayer.play("run")
	elif (Input.is_action_just_pressed("dodge")):
		direction = (transform.basis * Vector3(0.5, 0, 0))
		$matador2/AnimationPlayer.play("enticing")
	elif (Input.is_action_just_released("dodge")):
		direction_zero()
	
	if (!$matador2/AnimationPlayer.is_playing()):
		$matador2/AnimationPlayer.play("stand")
		
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
	if "Coin" in body.name:
		body.queue_free()
		coin.emit()
	elif "Bull" in body.name:
		damage()

func damage():
	health -= 1
	$HUD/health.text = var_to_str(health)
	if health == 0:
		die()

func _on_win():
	queue_free()
