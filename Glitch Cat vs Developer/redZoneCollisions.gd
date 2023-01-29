# for the red zone !!

extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


#delays next scene then goes to gameover scene, try again
func _on_redZone_mouse_entered():
	yield(get_tree().create_timer(0.5), "timeout") #delays next scene
	
	get_tree().change_scene("res://LoseScreen.tscn")


#the rest is the same collision but in different areas...
func _on_redZone2_mouse_entered():
	_on_redZone_mouse_entered()


func _on_redZone3_mouse_entered():
	_on_redZone_mouse_entered()


func _on_redZone4_mouse_entered():
	_on_redZone_mouse_entered()


func _on_redZone5_mouse_entered():
	_on_redZone_mouse_entered()


func _on_redZone6_mouse_entered():
	_on_redZone_mouse_entered()


func _on_redZone7_mouse_entered():
	_on_redZone_mouse_entered()
