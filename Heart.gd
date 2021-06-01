extends StaticBody

export (int) var heartLife = 10000

func UpdateLife(value):
	heartLife += value
	$Lifebar/Viewport/HeartLifebar.value = heartLife
	if self.heartLife <= 0:
		get_parent().heartDefeated()

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
