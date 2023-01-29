extends Node2D

export var count_value = 5


# Called when the node enters the scene tree for the first time.
func _ready():
	print("ran")
	self.get_node("sec").text = str(count_value)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	count_value -= 1
	self.get_node("sec").text = str(count_value)
	if count_value <= 0:
		yield(get_tree().create_timer(0.5), "timeout")
		get_tree().change_scene("res://LoseScreen.tscn")
	
