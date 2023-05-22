extends Control

func _process(_delta):
	$coins.text = str(GlobalVariables.coins)
