extends NinePatchRect

onready var tower = $TowerPocket.tower
var towerName = ""
var towerCost = 0

func _ready():
	var dummy_tower = tower.instance()
	self.towerName = dummy_tower.towerName
	$TowerName.text = dummy_tower.towerName
	self.towerCost = dummy_tower.cost
	$TowerCost.text = "$" + String(dummy_tower.cost)
	$UnitSpr.texture = dummy_tower.get_node("Thumbnail").texture
	call_deferred("queue_free",dummy_tower)

func button_disable():
	$Button.disabled = true

func button_enable():
	$Button.disabled = false

func _on_Button_pressed():
	if (get_parent().get_parent().get_parent().resource) >= self.towerCost:
		get_parent().get_parent().place_mode(tower)
