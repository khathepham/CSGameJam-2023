extends Node2D

export var mainGameScene : PackedScene


func _on_Play_button_pressed():
	get_tree().change_scene("res://final cut-scene.tscn")


func _on_How_to_play_button_pressed():
	get_tree().change_scene("res://Instructions.tscn")
