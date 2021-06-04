extends "res://Tower.gd"

func attack():
	if self.canAttack:
		if get_parent().has_method("change_resource"):
			get_parent().change_resource(int((get_parent().resource + self.power) * 1.01))
		self.canAttack = false
		$AttackTimer.start()

func _ready():
	self.canAttack = true

func _on_AttackRange_area_entered(area):
	pass

func _on_AttackRange_area_exited(area):
	pass
