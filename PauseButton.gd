extends NinePatchRect

var texture_index = 0

func _on_PauseButton_pressed():
	get_tree().paused = not get_tree().paused
	get_parent().get_node("PauseMenu").visible = not get_parent().get_node("PauseMenu").visible
	texture_index = (texture_index + 1) % 2
	$TextureRect.texture = $ButtonTextures.textures[texture_index]