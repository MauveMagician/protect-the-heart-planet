extends ImmediateGeometry

func _ready():
	var curve_to_draw = self.get_parent().curve.get_baked_points()
	self.begin(Mesh.PRIMITIVE_LINE_STRIP)
	self.set_color(Color(87,0,127))
	for p in curve_to_draw:
		var left = Vector3(p.x-1, p.y, p.z)
		var right = Vector3(p.x+1, p.y, p.z)
		var up = Vector3(p.x, p.y, p.z-1)
		var down = Vector3(p.x, p.y, p.z+1)
		var yplus = Vector3(p.x, p.y+1, p.z)
		var yminus = Vector3(p.x, p.y-1, p.z)
		self.add_vertex(left)
		self.add_vertex(right)
		self.add_vertex(up)
		self.add_vertex(down)
		self.add_vertex(yplus)
		self.add_vertex(yminus)
		self.add_vertex(p)
	self.end()