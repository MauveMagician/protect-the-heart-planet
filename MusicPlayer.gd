extends AudioStreamPlayer

var tracks = ["res://music/A cup of tea.ogg", "res://music/Bartender.ogg", "res://music/Cat caffe.ogg", "res://music/Countryside.ogg", "res://music/Florist.ogg", "res://music/Morning rain.ogg", "res://music/Oceanside.ogg", "res://music/Rainy Forest.ogg"]

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()

func music_start():
	tracks.shuffle()
	var t = Timer.new()
	t.set_wait_time(2.0)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	self.stream = load(tracks[0])
	self.play()

func _on_MusicPlayer_finished():
	var t = Timer.new()
	t.set_wait_time(2.0)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	tracks.shuffle()
	self.stream = load(tracks[0])
	self.play()