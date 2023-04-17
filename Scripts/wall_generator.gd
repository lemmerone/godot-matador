extends Node

var wall = preload("res://World/Wall/wall.tscn")
var countWall

func wall_setting(count, center, node):
	var angle = 0
	var angle_step = 2.0 * PI / count
	var radius = 10 / (2 * tan(PI / count))
	for i in range(0, count):
		var direction = Vector3(sin(angle), 0, cos(angle))
		var pos = center + direction * radius

		var newWall = wall.instantiate()
		newWall.position = pos
		newWall.rotation.y = angle
		node.add_child(newWall)

		angle += angle_step
