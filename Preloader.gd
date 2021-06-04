extends Node

export (Array, PackedScene) var assets

export (Array, PackedScene) var stages

export (Array, PackedScene) var spawners

func _ready():
	assets[0] = preload("res://Bullet.tscn")
	assets[1] = preload("res://SlowBullet.tscn")