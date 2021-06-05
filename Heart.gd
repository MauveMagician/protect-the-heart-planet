extends StaticBody

export (int) var heartLife = 10000

var maxHeartLife = 10000

func UpdateLife(value):
	if (self.heartLife + value) <= maxHeartLife:
		if value < 0:
			print("got here!")
			Preloader.get_node("SoundEffects/HeartDamageSound").play()
		self.heartLife += value
		$Lifebar/Viewport/HeartLifebar.value = self.heartLife
		if self.heartLife <= 0:
			get_parent().heartDefeated()
	else:
		self.heartLife = maxHeartLife

func get_class():
	return "Heart"

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("HeartAnimation")

func _on_Area_area_entered(area):
	var enteringNode = area.get_parent()
	if enteringNode.has_method("get_class") and enteringNode.get_class() == "Enemy":
		self.UpdateLife(-1 * enteringNode.heartDamage)
		enteringNode.value = 0
		enteringNode.die()

func _on_RegenTimer_timeout():
	self.UpdateLife(5)
