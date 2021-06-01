extends Control

func _on_MenuButton_pressed():
	get_tree().change_scene_to(Preloader.stages[0])
