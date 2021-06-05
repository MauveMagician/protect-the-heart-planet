extends NinePatchRect

onready var tower = $TowerPocket.tower
var towerName = ""
var towerCost = 0
var costMod = 1.5

func _ready():
	var dummy_tower = tower.instance()
	self.towerName = dummy_tower.towerName
	$TowerName.text = dummy_tower.towerName
	self.towerCost = dummy_tower.cost
	self.costMod = dummy_tower.costMod
	$TowerCost.text = "$" + String(self.towerCost)
	$UnitSpr.texture = dummy_tower.get_node("Thumbnail").texture
	$Button.hint_tooltip = dummy_tower.description
	call_deferred("queue_free",dummy_tower)

func update_tower_cost(value):
	self.towerCost = value
	$TowerCost.text = "$" + String(self.towerCost)

func button_disable():
	$Button.disabled = true

func button_enable():
	$Button.disabled = false

func _on_Button_pressed():
	if (get_parent().get_parent().get_parent().resource) >= self.towerCost:
		get_parent().get_parent().place_mode(self)
	else:
		Preloader.get_node("SoundEffects/CancelSound").play()
