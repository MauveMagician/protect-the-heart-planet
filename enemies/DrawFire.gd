extends Area

func _on_DrawFire_body_entered(body):
	if body.get_class() == "Tower":
		body.attackTarget = get_parent()