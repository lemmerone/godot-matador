extends Node

@export var mob_scene: PackedScene
@export var coin_scene: PackedScene

var tutorial_state = 1

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

func _on_coin_timer_timeout():
	var coin = coin_scene.instantiate()
	coin.initialize(random_mob_poss())
	add_child(coin)

func end_level():
	$MobTimer.stop()
	$Player.emit_signal("win")
	$GameTimer.emit_signal("stop")
	GlobalVariables.coins += 100
	GlobalVariables.level = 3
	get_tree().change_scene_to_file("res://Scenes/Win Game/win_game.tscn")
	
func _on_player_hit():
	$MobTimer.stop()
	get_tree().change_scene_to_file("res://Scenes/Game Over/lose_game.tscn")
	
func _on_player_coin():
	GlobalVariables.coins += 10
	
func _process(_delta):
	if $GameTimer/time.text == "01 : 00":
		end_level()

func _on_button_pressed():
	tutorial_state += 1
	if tutorial_state == 2:
		$Tutorial.hide()
		$MobTimer.start()
		$CoinTimer.start()
		$Player/HUD.show()
		$GameTimer.show()
		$GameTimer.emit_signal("start")
