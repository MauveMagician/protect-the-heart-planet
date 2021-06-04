extends "res://Tower.gd"

func attack():
	if is_instance_valid(attackTarget) and attackTarget and attackTarget.get_class() == "Enemy" and canAttack and attackTarget.get_node("EnemyArea") in $AttackRange.get_overlapping_areas() and attackTarget.targetable:
		var newBullet = Preloader.assets[1].instance()
		newBullet.velocity = (attackTarget.global_transform.origin - self.global_transform.origin).normalized()
		newBullet.transform = self.global_transform
		newBullet.power = self.power
		get_parent().add_child(newBullet)
		self.canAttack = false
		$AttackTimer.start()