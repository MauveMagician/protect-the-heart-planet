extends Spatial

export (int) var resource = 20
export (int) var wave = 0
export (String) var course_name = "Course"

signal wave_changed
signal resource_changed

var experience = 0
var rng = RandomNumberGenerator.new()

func _ready():
	get_tree().paused = false
	rng.randomize()

func change_resource(value):
	self.resource = value
	self.experience += abs(self.resource-value)
	emit_signal("resource_changed")

func change_wave(value):
	self.wave = value
	emit_signal("wave_changed")

func heartDefeated():
	get_tree().paused = true
	$UI/LoseScreen.visible = true

func _on_NextWaveTimer_timeout():
	var rng_cap = min(Preloader.spawners.size(), self.wave/5)
	var randomNumber = clamp(rng.randi_range(0,rng_cap),0,Preloader.spawners.size()-1)
	var new_spawner = Preloader.spawners[randomNumber].instance()
	$Path.add_child(new_spawner)