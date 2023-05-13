extends Node

@onready var player = get_node("Player")
@export var mob_scene: PackedScene

func _ready():
	WallGenerator.wall_setting(Vector3.ZERO, $World)

func random_mob_poss():
	return WallGenerator.center_walls[randi_range(0, GlobalVariables.sides - 1)]

func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()
	var player_position = $Player.position
	
	mob.initialize(random_mob_poss(), player_position)
	add_child(mob)

func _on_player_hit():
	$MobTimer.stop()
	get_tree().change_scene_to_file("res://Levels/Game Over/game_over.tscn")
