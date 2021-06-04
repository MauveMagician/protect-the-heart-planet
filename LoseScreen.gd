extends NinePatchRect

func _on_RetryButton_pressed():
	get_tree().paused = false
	var new_scene = get_tree().change_scene_to(Preloader.stages[Preloader.playing_course_index])

func _on_QuitButton_pressed():
	get_tree().paused = false
	var new_scene = get_tree().change_scene("res://StartScreen.tscn")