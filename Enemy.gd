extends PathFollow

export (int) var heartDamage = 1000
export (int) var towerDamage = 1
export (int) var life = 1
export (int) var value = 1
export (float) var moveSpeed = 0.004
export (float) var lifeScalingFactor = 2

var targetable = false

func die():
	var gameScene = get_parent().get_parent()
	gameScene.change_resource(gameScene.resource + self.value)
	self.queue_free()

func take_damage(value):
	Preloader.get_node("SoundEffects/EnemyHitSound").play()
	self.life -= value
	if self.life <= 0:
		self.die()

func get_class():
	return "Enemy"

func _ready():
	$EnemyArea.monitorable = false
	self.offset = 0
	self.life += floor((1.25 * self.get_parent().get_parent().wave * self.lifeScalingFactor))
	self.value += floor(0.5 * self.get_parent().get_parent().wave)

func _process(delta):
	self.offset += self.moveSpeed * 180 * (1.0 + delta)

func _on_Untargetable_timeout():
	self.targetable = true
	$EnemyArea.monitorable = true
