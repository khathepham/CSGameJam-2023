extends Timer


var timer = null


# Called when the node enters the scene tree for the first time.
func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(2)
	timer.connect("timeout", self, "_on_Timer_timeout")
	add_child(timer)
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	get_tree().change_scene("res://CutScenes/Roombackground3.tscn")
