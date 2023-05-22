extends Control

func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://Scenes/Levels/level%d.tscn" % [GlobalVariables.level])

func _on_shop_pressed():
	pass # Replace with function body.
