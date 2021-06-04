extends "res://Tower.gd"

func attack():
	pass

func _on_AttackRange_area_entered(area):
	var target = area.get_parent()
	if target.has_method("get_class") and target.get_class() == "AllyProjectile":
		target.power *= self.power

func _on_AttackRange_area_exited(area):
	pass

func _process(delta):
	pass

func _on_AttackTimer_timeout():
	pass