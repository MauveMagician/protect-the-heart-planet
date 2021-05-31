extends Node

export (Array, PackedScene) var mobs

func _on_Timer_timeout():
	get_parent().add_child(mobs[0].instance())
