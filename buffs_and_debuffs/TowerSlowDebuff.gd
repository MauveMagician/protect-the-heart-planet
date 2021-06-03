extends Node

export (float) var slow_amount = 1
export (float) var duration = 1

onready var debuffed_unit = self.get_parent()

var speed_before_slow = 1.0

func get_class():
	return "Debuff"

func get_debuff_type():
	return "Slow"

func _ready():
	if debuffed_unit.get_class() == "Tower":
		for c in debuffed_unit.get_children():
			if c.get_class() == "Debuff":
				if  c != self and c.get_debuff_type() == "Slow":
					self.queue_free()
					return
		$Duration.wait_time = self.duration
		$Duration.start()
		speed_before_slow = debuffed_unit.get_node("AttackTimer").wait_time
		self.debuffed_unit.get_node("AttackTimer").wait_time += (self.slow_amount * speed_before_slow)

func cure():
	self.debuffed_unit.get_node("AttackTimer").wait_time -= (self.slow_amount * speed_before_slow)
	self.queue_free()

func _on_Duration_timeout():
	self.cure()