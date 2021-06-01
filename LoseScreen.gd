extends NinePatchRect

func _on_RetryButton_pressed():
	get_tree().paused = false
	var new_scene = get_tree().change_scene("res://GameScene.tscn")

func _on_QuitButton_pressed():
	get_tree().paused = false
	var new_scene = get_tree().change_scene("res://StartScreen.tscn")