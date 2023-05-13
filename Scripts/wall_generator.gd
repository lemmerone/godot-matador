extends Node

var wall = preload("res://World/Wall/wall.tscn")
var side_length = 25
var center_walls = []

func wall_setting(center, node):
	var angle_increment = 2 * PI / GlobalVariables.sides
	var radius = side_length / (2 * tan(PI / GlobalVariables.sides))
	for i in range(GlobalVariables.sides):
		var newWall = wall.instantiate()
		var angle = i * angle_increment
		var x  = sin(angle) * radius
		var z = cos(angle) * radius
		
		newWall.position = center + Vector3(x, 0, z)
		newWall.rotate_y(angle)
		node.add_child(newWall)
		
		center_walls.append(Vector3(x, 0, z))
