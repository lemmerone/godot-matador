extends Node

@onready var wallGenerator = get_node("/root/WallGenerator")
@onready var player = get_node("Player")
@export var num_sides : int
@export var mob_scene: PackedScene

func _ready():
	player.set_num_sides(num_sides)
	wallGenerator.wall_setting(num_sides, Vector3.ZERO, $World)

func random_mob_poss():
	var rng = RandomNumberGenerator.new()
	var i = rng.randi_range(0, num_sides - 1)
	return wallGenerator.center_walls[i]

func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()

	var player_position = $Player.position
	mob.initialize(random_mob_poss(), player_position)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)
