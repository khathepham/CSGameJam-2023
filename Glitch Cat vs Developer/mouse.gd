extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# when player enters this zone, takes player to level 2
func _on_greenZone_mouse_entered():
	yield(get_tree().create_timer(0.5), "timeout") #delays next scene
	
	get_tree().change_scene("res://WinScreen.tscn")


# goes to the first level when the mouse hovers try again zone
func _on_tryAgainHoverZone_mouse_entered():
	yield(get_tree().create_timer(0.5), "timeout") #delays next scene
	
	get_tree().change_scene("res://Map.tscn")



func _on_greenZone2_mouse_entered():
	yield(get_tree().create_timer(0.5), "timeout") #delays next scene
	
	get_tree().change_scene("res://Map.tscn")
