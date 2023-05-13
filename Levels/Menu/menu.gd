extends Control

func _on_new_game_pressed():
	get_tree().change_scene_to_file("res://Levels/Select Level/select_level.tscn")

func _on_exit_pressed():
	get_tree().quit()
