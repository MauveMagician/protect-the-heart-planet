extends KinematicBody

export var towerName = "Gunner"
export var power = 100
export var cost = 5

var attackTarget = null
var canAttack = true

func attack():
	if is_instance_valid(attackTarget) and attackTarget and attackTarget.get_class() == "Enemy" and canAttack and attackTarget.get_node("EnemyArea") in $AttackRange.get_overlapping_areas():
		var newBullet = Preloader.assets[0].instance()
		newBullet.velocity = (attackTarget.global_transform.origin - self.global_transform.origin).normalized()
		newBullet.transform = self.global_transform
		newBullet.power = self.power
		get_parent().add_child(newBullet)
		self.canAttack = false
		$AttackTimer.start()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta):
	self.attack()

func _on_AttackRange_area_entered(area):
	var target = area.get_parent()
	if target.has_method("get_class") and target.get_class() == "Enemy":
		self.attackTarget = target

func _on_AttackRange_area_exited(area):
	if area == self.attackTarget:
		self.attackTarget = null
		var new_target = null
		for t in $AttackRange.get_overlapping_areas():
			if t.get_class() == "Enemy":
				if not new_target and t.life < new_target.life:
					new_target = t
					print(t)
		if new_target:
			self.attackTarget = new_target
		else:
			self.attackTarget = null

func _on_AttackTimer_timeout():
	self.canAttack = true
