extends Node

@onready var player = get_node("Player")
@export var mob_scene: PackedScene

var tutorial_state = 1
var pressed_a = false
var pressed_d = false
var pressed_space = false
var pressed_hit = false

func _ready():
	$Player/HUD.hide()
	$GameTimer.hide()
	WallGenerator.wall_setting(Vector3.ZERO, $World)

func random_mob_poss():
	return WallGenerator.center_walls[randi_range(0, GlobalVariables.sides - 1)]

func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()
	mob.initialize(random_mob_poss())
	add_child(mob)
	
func end_level():
	$MobTimer.stop()
	$Player.emit_signal("win")
	$GameTimer.emit_signal("stop")
	GlobalVariables.coins += 100
	GlobalVariables.level = 2
	get_tree().change_scene_to_file("res://Scenes/Win Game/win_game.tscn")
	
func _on_player_hit():
	$MobTimer.stop()
	get_tree().change_scene_to_file("res://Scenes/Game Over/lose_game.tscn")
	
func _process(_delta):
	if tutorial_state == 3:
		if (Input.is_action_just_pressed("rotation_right")):
			pressed_a = true
		if (Input.is_action_just_pressed("rotation_left")):
			pressed_d = true
		if pressed_a && pressed_d:
			$"Tutorial/Сontinue".show()
	if tutorial_state == 4:
		if (Input.is_action_just_pressed("dodge")):
			pressed_space = true
			if pressed_space:
				$"Tutorial/Сontinue".show()
	if $GameTimer/time.text == "00 : 15":
		end_level()

func _on_button_pressed():
	tutorial_state += 1
	if tutorial_state == 2:
		$Tutorial/Welcome.hide()
		$Tutorial/Matador.show()
		$Camera3D.current = false
	if tutorial_state == 3:
		$Tutorial/Matador.hide()
		$Tutorial/Rotation.show()
		$"Tutorial/Сontinue".hide()
	if tutorial_state == 4:
		$Tutorial/Rotation.hide()
		$Tutorial/Space.show()
		$"Tutorial/Сontinue".hide()
	if tutorial_state == 5:
		$Tutorial/Space.hide()
		$Tutorial/Health.show()
		$Player/HUD.show()
		$Tutorial.position.x = 70
		$Tutorial.position.y = 70
	if tutorial_state == 6:
		$Tutorial/Health.hide()
		$Tutorial/Start.show()
	if tutorial_state == 7:
		$Tutorial.hide()
		$MobTimer.start()
		$GameTimer.show()
		$GameTimer.emit_signal("start")
