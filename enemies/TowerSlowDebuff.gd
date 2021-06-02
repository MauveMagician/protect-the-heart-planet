extends Node

export (float) var slow_amount = 1
export (float) var duration = 1

onready var debuffed_unit = self.get_parent()

func get_class():
	return "Debuff"

func get_debuff_type():
	return "Slow"

func _ready():
	if debuffed_unit.get_class() == "Tower":
		for c in debuffed_unit.get_children():
			if c.get_class() == "Debuff":
				if c.get_debuff_type() == "Slow" and c != self:
					return
		$Duration.wait_time = self.duration
		$Duration.start()
		self.debuffed_unit.get_node("AttackTimer").wait_time += ((self.slow_amount) * debuffed_unit.get_node("AttackTimer").wait_time)

func cure():
	self.debuffed_unit.get_node("AttackTimer").wait_time -= ((1.0 - self.slow_amount) * debuffed_unit.get_node("AttackTimer").wait_time)
	self.queue_free()

func _on_Duration_timeout():
	self.cure()