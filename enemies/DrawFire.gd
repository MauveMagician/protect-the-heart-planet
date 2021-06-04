extends Area

func _on_DrawFire_body_entered(body):
	if body.get_class() == "Tower":
		body.attackTarget = get_parent()

func _on_TauntTimer_timeout():
	for b in self.get_overlapping_bodies():
		if b.get_class() == "Tower" and b.attackTarget != self.get_parent() and get_parent().get_node("EnemyArea") in b.target_queue:
			b.attackTarget = get_parent()
