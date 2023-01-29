extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _stop_move():
	return 

func _snap():
	pass
	
func _can_move():
	pass

func _on_Win_Block_area_entered(area):
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().change_scene("res://WinScreen.tscn")
