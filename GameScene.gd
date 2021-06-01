extends Spatial

export (int) var resource = 20
export (int) var wave = 1

signal wave_changed
signal resource_changed

func change_resource(value):
	self.resource = value
	emit_signal("resource_changed")

func change_wave(value):
	self.wave = value
	emit_signal("wave_changed")