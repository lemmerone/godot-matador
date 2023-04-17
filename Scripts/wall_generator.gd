extends Node

var wall = preload("res://World/Wall/wall.tscn")
var side_length = 10

func wall_setting(num_sides, center, node):
	var angle_increment = 2 * PI / num_sides
	var radius = side_length / (2 * tan(PI / num_sides))
	for i in range(num_sides):
		var newWall = wall.instantiate()
		var angle = i * angle_increment
		
		newWall.position = center + Vector3(sin(angle), 0, cos(angle)) * radius
		newWall.rotate_y(angle)
		
		node.add_child(newWall)
