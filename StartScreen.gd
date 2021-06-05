extends Control

func _ready():
	Preloader.get_node("MusicPlayer").playing = false

func _on_MenuButton_pressed():
	$CourseSelect.visible = true
	Preloader.get_node("SoundEffects/ConfirmSound").play()
	$BasicButtonsContainer.get_node("StartButtonRect/MenuButton").visible = false

func _on_BackButton_pressed():
	$CourseSelect.visible = false
	Preloader.get_node("SoundEffects/CancelSound").play()
	$BasicButtonsContainer.get_node("StartButtonRect/MenuButton").visible = true

func _on_SerpentineButton_pressed():
	Preloader.playing_course_index = 3
	get_tree().change_scene_to(Preloader.stages[3])

func _on_SpiralButton_pressed():
	Preloader.playing_course_index = 5
	get_tree().change_scene_to(Preloader.stages[5])

func _on_YarnButton_pressed():
	Preloader.playing_course_index = 6
	get_tree().change_scene_to(Preloader.stages[6])

func _on_SimpleButton_pressed():
	Preloader.playing_course_index = 4
	get_tree().change_scene_to(Preloader.stages[4])

func _on_OnslaughtButton_pressed():
	Preloader.playing_course_index = 2
	get_tree().change_scene_to(Preloader.stages[2])

func _on_ClassicButton_pressed():
	Preloader.playing_course_index = 1
	get_tree().change_scene_to(Preloader.stages[1])

func _on_GithubButton_pressed():
	OS.shell_open("https://github.com/MauveMagician/protect-the-heart-planet")
