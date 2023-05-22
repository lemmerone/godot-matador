extends Control

func _ready():
	$coins.text = str(GlobalVariables.coins)

func _on_levels_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/level%d.tscn" % [GlobalVariables.level])

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/Menu/menu_3d.tscn")
