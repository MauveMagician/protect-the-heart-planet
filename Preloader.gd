extends Node

export (Array, PackedScene) var assets

export (Array, PackedScene) var stages

export (Array, PackedScene) var spawners

class CustomSorter:
	static func sort_life_ascending(a, b):
		if a.life < b.life:
			return true
		return false