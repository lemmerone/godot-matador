extends Control

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://HUD/Menu/menu.tscn")
