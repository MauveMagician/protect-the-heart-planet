extends PathFollow

export (int) var heartDamage = 1000
export (int) var towerDamage = 1
export (int) var life = 5
export (float) var moveSpeed = 0.004

func die():
	self.queue_free()

func take_damage(value):
	self.life -= value
	if self.life <= 0:
		self.die()

func get_class():
	return "Enemy"

func _ready():
	self.offset = 0

func _process(delta):
	self.unit_offset += self.moveSpeed
