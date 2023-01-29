extends Node2D

func _ready():
	$AudioStreamPlayer.play()

func _on_Back_pressed():
	get_tree().change_scene("res://MainMenu.tscn")
