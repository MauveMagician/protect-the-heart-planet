extends Node

export (Array, PackedScene) var mobs

func _on_Timer_timeout():
	var new_mob = mobs[1].instance()
	get_parent().add_child(new_mob)
