extends "res://Bullet.gd"

func hit(target):
	target.take_damage(self.power)
	target.moveSpeed = 0.001
	if not pierce:
		self.queue_free()