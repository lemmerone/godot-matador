extends Node

@onready var wallGenerator = get_node("/root/WallGenerator")
@export var num_sides = 0

func _ready():
	wallGenerator.wall_setting(num_sides, Vector3.ZERO, $World)
