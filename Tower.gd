extends KinematicBody

export var towerName = "Gunner"
export var power = 100.0
export var cost = 5
export var costMod = 1.5
export (String) var description = ""

var attackTarget = null
var canAttack = true
var target_queue = []

func get_class():
	return "Tower"

func attack():
	if is_instance_valid(attackTarget) and attackTarget and attackTarget.get_class() == "Enemy" and canAttack and attackTarget.get_node("EnemyArea") in $AttackRange.get_overlapping_areas() and attackTarget.targetable:
		Preloader.get_node("SoundEffects/ShootingSound").play()
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
		if not self.attackTarget or !is_instance_valid(self.attackTarget) or self.attackTarget.get_class() != "Enemy":
			self.attackTarget = target
		else:
			target_queue.push_back(target)

func _on_AttackRange_area_exited(area):
	if area.get_parent() == self.attackTarget:
		if !is_instance_valid(self.attackTarget) or self.attackTarget.get_class() != "Enemy":
			self.attackTarget = null
		while not target_queue.empty():
			var t = target_queue.pop_front()
			if is_instance_valid(t) and t.get_class() == "Enemy":
					self.attackTarget = t
					return
		self.attackTarget = null

func _on_AttackTimer_timeout():
	self.canAttack = true
