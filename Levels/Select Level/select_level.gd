extends Control

func _on_level_1_pressed():
	GlobalVariables.sides = 5
	get_tree().change_scene_to_file("res://Levels/level.tscn")

func _on_level_2_pressed():
	GlobalVariables.sides = 7
	get_tree().change_scene_to_file("res://Levels/level.tscn")

func _on_level_3_pressed():
	GlobalVariables.sides = 10
	get_tree().change_scene_to_file("res://Levels/level.tscn")
