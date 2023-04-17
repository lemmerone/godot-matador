extends Node

@onready var wall_generator = get_node("/root/WallGenerator")

@export var countWall = 7

func _ready():
	wall_generator.wall_setting(countWall, Vector3.ZERO, $World)
