extends Node

export (Array, PackedScene) var mobs

var idx = 0

onready var gameScene = get_parent().get_parent()

func _ready():
	gameScene.change_wave(gameScene.wave + 1)

func _on_Timer_timeout():
	if idx < mobs.size():
		var new_mob = mobs[idx]
		if new_mob:
			new_mob = new_mob.instance()
			get_parent().add_child(new_mob)
			idx += 1
	else:
		self.queue_free()
