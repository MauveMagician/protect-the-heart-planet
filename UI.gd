extends Control

var placing = false
var placing_tower = null

onready var camera = get_parent().get_node("CameraPivot/MainCamera")

func place_mode(tower):
	$CardContainer.visible = false
	for c in $CardContainer.get_children():
		if c.has_method("button_disable"):
			c.button_disable()
	placing = true
	placing_tower = tower

func normal_mode():
	placing = false
	placing_tower = null
	$CardContainer.visible = true
	for c in $CardContainer.get_children():
		if c.has_method("button_enable"):
			c.button_enable()

func _input(event):
	if placing:
		if event is InputEventMouseButton and event.is_pressed() and event.button_index == 1:
			var from = camera.project_ray_origin(event.position)
			var to = from + camera.project_ray_normal(event.position) * 1000
			var world = $"..".get_world()
			var space_state = world.direct_space_state
			var result = space_state.intersect_ray(to,from)
			if result and (result.get("collider").get_name() == "GameBoard"):
				var new_tower = placing_tower.instance()
				get_parent().add_child(new_tower)
				new_tower.global_transform.origin = Vector3(result.position.x,4,result.position.z)
			self.normal_mode()
