extends Node

var wall = preload("res://World/Wall/wall.tscn")
@export var countWall = 6

func _ready():
	wall_setting(countWall, Vector3.ZERO)

func wall_setting(count, center):
	var angle_step = 2.0 * PI / count
	var radius = 10 / (2 * tan(PI / count))
	var angle = 0
	for i in range(0, count):
		var direction = Vector3(sin(angle), 0, cos(angle))
		var pos = center + direction * radius

		var newWall = wall.instantiate()
		newWall.position = pos
		newWall.rotation.y = angle
		$World.add_child(newWall)

		angle += angle_step
