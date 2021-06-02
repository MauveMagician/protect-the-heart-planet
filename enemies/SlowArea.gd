extends Area

export (PackedScene) var debuff

func _on_PulseTimer_timeout():
	for b in self.get_overlapping_bodies():
		if b.get_class() == "Tower":
			var new_TowerSlowDebuff = debuff.instance()
			b.add_child(new_TowerSlowDebuff)