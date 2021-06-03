extends "res://Tower.gd"

func attack():
	if self.canAttack:
		if get_parent().has_method("change_resource"):
			get_parent().change_resource(get_parent().resource + self.power)
		self.canAttack = false
		$AttackTimer.start()

func _ready():
	self.canAttack = true

func _on_AttackRange_area_entered(area):
	pass

func _on_AttackRange_area_exited(area):
	pass
