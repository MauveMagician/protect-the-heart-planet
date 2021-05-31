extends NinePatchRect

onready var tower = $TowerPocket.tower

func _ready():
	var dummy_tower = tower.instance()
	$TowerName.text = dummy_tower.towerName
	$TowerCost.text = "$" + String(dummy_tower.cost)
	$UnitSpr.texture = dummy_tower.get_node("Sprite3D").texture
	call_deferred("queue_free",dummy_tower)

func button_disable():
	$Button.disabled = true

func button_enable():
	$Button.disabled = false

func _on_Button_pressed():
	get_parent().get_parent().place_mode(tower)
