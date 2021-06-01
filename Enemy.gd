extends PathFollow

export (int) var heartDamage = 1000
export (int) var towerDamage = 1
export (int) var life = 5
export (int) var value = 1
export (float) var moveSpeed = 0.004

var targetable = false

func die():
	var gameScene = get_parent().get_parent()
	gameScene.change_resource(gameScene.resource + self.value)
	self.queue_free()

func take_damage(value):
	self.life -= value
	if self.life <= 0:
		self.die()

func get_class():
	return "Enemy"

func _ready():
	self.offset = 0

func _process(_delta):
	self.unit_offset += self.moveSpeed

func _on_Untargetable_timeout():
	self.targetable = true
