extends Control

var placing = false
var placing_card = null
var placing_tower = null
var current_stage = Preloader.stages[0]

onready var camera = get_parent().get_node("CameraPivot/MainCamera")

func _ready():
	$WaveMoneyRect/WaveLabel.text = "LEVEL " + String(get_parent().wave)
	$WaveMoneyRect/MoneyLabel.text = "MONEY " + String(get_parent().resource)

func place_mode(tower_card):
	var tower = tower_card.tower
	placing_card = tower_card
	$CardContainer.visible = false
	for c in $CardContainer.get_children():
		if c.has_method("button_disable"):
			c.button_disable()
	placing = true
	placing_tower = tower

func normal_mode():
	placing = false
	placing_tower = null
	placing_card = null
	$CardContainer.visible = true
	for c in $CardContainer.get_children():
		if c.has_method("button_enable"):
			c.button_enable()

func _input(event):
	if placing:
		if event is InputEventMouseButton and event.is_pressed() and event.button_index == 1:
			var from = camera.project_ray_origin(event.position)
			var to = from + camera.project_ray_normal(event.position) * 1000
			var world = $"..".get_world()
			var space_state = world.direct_space_state
			var result = space_state.intersect_ray(to,from)
			if result and (result.get("collider").get_name() == "GameBoard"):
				var new_tower = placing_tower.instance()
				get_parent().add_child(new_tower)
				new_tower.global_transform.origin = Vector3(result.position.x,4,result.position.z)
				get_parent().change_resource(get_parent().resource - self.placing_card.towerCost)
				placing_card.update_tower_cost(floor(self.placing_card.towerCost * self.placing_card.costMod))
				Preloader.get_node("SoundEffects/ConfirmSound").play()
			else:
				Preloader.get_node("SoundEffects/CancelSound").play()
			self.normal_mode()
		if event is InputEventMouseButton and event.is_pressed() and event.button_index != 1:
			Preloader.get_node("SoundEffects/CancelSound").play()
			self.normal_mode()

func _on_GameScene_resource_changed():
	if get_parent().resource > 999:
		$WaveMoneyRect/MoneyLabel.text = "$" + String(get_parent().resource)
	else:
		$WaveMoneyRect/MoneyLabel.text = "MONEY " + String(get_parent().resource)

func _on_GameScene_wave_changed():
	if get_parent().wave > 99:
		$WaveMoneyRect/WaveLabel.text = "L" + String(get_parent().wave)
	else:
		$WaveMoneyRect/WaveLabel.text = "LEVEL " + String(get_parent().wave)

func _on_HSlider_value_changed(value):
	Preloader.get_node("MusicPlayer").volume_db = float(value)

func _on_HSlider_mouse_exited():
	$SettingsMenu/SettingsRectangle/VolumeControl/HSlider.release_focus()

func _on_CheckButton_button_up():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 0)

func _on_CheckButton_toggled(button_pressed):
	Preloader.get_node("SoundEffects/ConfirmSound").play()
	var idx = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(idx, not AudioServer.is_bus_mute(idx))

func _on_CheckButton_mouse_exited():
	$SettingsMenu/SettingsRectangle/VolumeControl2/CheckButton.release_focus()

func _on_SFX_HSlider_value_changed(value):
	for s in Preloader.get_node("SoundEffects").get_children():
		s.volume_db = float(value)
		Preloader.get_node("SoundEffects/CancelSound").play()

func _on_SFX_HSlider_mouse_exited():
	$SettingsMenu/SettingsRectangle/SFXVolumeControl/SFX_HSlider.release_focus()
