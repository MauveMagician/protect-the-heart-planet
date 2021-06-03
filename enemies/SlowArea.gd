extends Area

export (PackedScene) var debuff
export (float) var slowAmount = 1.0

func _on_PulseTimer_timeout():
	for b in self.get_overlapping_bodies():
		if b.get_class() == "Tower":
			var new_TowerSlowDebuff = debuff.instance()
			new_TowerSlowDebuff.slow_amount = slowAmount
			b.add_child(new_TowerSlowDebuff)