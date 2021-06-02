extends Spatial

export (int) var speed = 320
export var velocity = Vector3(0,0,0)
export var power = 1
export var pierce = false

var attackTarget = null

func get_class():
	return "AllyProjectile"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.velocity.y = 0

func _process(delta):
	self.global_transform.origin += self.velocity * self.speed * delta

func _on_Hurtbox_area_entered(area):
	var target = area.get_parent()
	if target.get_class() == "Enemy":
		if not attackTarget:
			hit(target)
		else:
			if target == attackTarget:
				hit(target)

func hit(target):
	target.take_damage(self.power)
	if not pierce:
		self.queue_free()

func _on_VisibilityNotifier_screen_exited():
	self.queue_free()
