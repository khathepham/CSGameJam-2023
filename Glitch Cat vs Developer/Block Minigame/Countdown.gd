extends Node2D

export var count_value = 200


# Called when the node enters the scene tree for the first time.
func _ready():
	print("ran")
	self.get_node("sec").text = str(count_value)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	print("ran")
	count_value -= 1
	self.get_node("sec").text = str(count_value)
