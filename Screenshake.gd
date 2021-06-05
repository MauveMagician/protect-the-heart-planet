extends Node
const TRANS = Tween.TRANS_SINE
const EASE = Tween.EASE_IN_OUT
var amplitude = 0
var priority = 0

onready var camera = get_parent()

func start(_duration = 0.25, _frequency = 30, _amplitude = 30, _priority=0):
	if _priority >= self.priority:
		self.priority = _priority
		self.amplitude = _amplitude
		$Duration.wait_time = _duration
		$Frequency.wait_time = 1/float(_frequency)
		$Duration.start()
		$Frequency.start()
		new_shake()

func new_shake():
	var rand = Vector2()
	rand.x = rand_range(-amplitude, amplitude)
	rand.y = rand_range(-amplitude, amplitude)
	$ShakeTween.interpolate_property(camera, "h_offset", camera.h_offset, rand.x, $Frequency.wait_time, TRANS, EASE)
	$ShakeTween.interpolate_property(camera, "v_offset", camera.v_offset, rand.y, $Frequency.wait_time, TRANS, EASE)
	$ShakeTween.start()

func reset():
	$ShakeTween.interpolate_property(camera, "h_offset", camera.h_offset, 0, $Frequency.wait_time, TRANS, EASE)
	$ShakeTween.interpolate_property(camera, "v_offset", camera.h_offset, 0, $Frequency.wait_time, TRANS, EASE)
	$ShakeTween.start()
	priority = 0

func _on_Frequency_timeout():
	new_shake()

func _on_Duration_timeout():
	reset()
	$Frequency.stop()