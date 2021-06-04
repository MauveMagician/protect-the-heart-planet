extends "res://Tower.gd"

func attack():
	pass

func _ready():
	$AttackRange.connect("body_entered",self,"_on_AttackRange_body_entered")
	$AttackRange.connect("body_exited",self,"_on_AttackRange_body_exited")

func _process(_delta):
	pass

func _on_AttackRange_body_entered(body):
	if body.get_class() == "Tower":
		body.get_node("AttackTimer").wait_time = max(0.01, body.get_node("AttackTimer").wait_time * self.power)

func _on_AttackRange_body_exited(body):
	if body.get_class() == "Tower":
		body.get_node("AttackTimer").wait_time = body.get_node("AttackTimer").wait_time / self.power