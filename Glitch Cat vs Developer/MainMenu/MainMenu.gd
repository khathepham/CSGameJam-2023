extends Node2D

export var mainGameScene : PackedScene

func _ready():
	get_node("MarginContainer/VBoxContainer/VBoxContainer/Play button").grab_focus()
	$AudioStreamPlayer.play()

func _input(event):
	if event is InputEventMouseMotion:
		get_node("MarginContainer/VBoxContainer/VBoxContainer/Play button").release_focus()
		get_node("MarginContainer/VBoxContainer/VBoxContainer/How to play button").release_focus()
		get_node("MarginContainer/VBoxContainer/VBoxContainer/Exit button").release_focus()

func _unhandled_input(event):
	var is_focus_play_button: bool = get_node("MarginContainer/VBoxContainer/VBoxContainer/Play button").has_focus()
	var is_focus_instruction_button: bool = get_node("MarginContainer/VBoxContainer/VBoxContainer/How to play button").has_focus()
	var is_focus_exit_button: bool = get_node("MarginContainer/VBoxContainer/VBoxContainer/Exit button").has_focus()
	if !is_focus_play_button and !is_focus_instruction_button and !is_focus_exit_button:
		get_node("MarginContainer/VBoxContainer/VBoxContainer/Play button").grab_focus()

func _on_mouse_exited():
	get_node("MarginContainer/VBoxContainer/VBoxContainer/Play button").grab_focus()

func _on_Play_button_pressed():
	get_tree().change_scene("res://CutScenes/Roombackground.tscn")

func _on_How_to_play_button_pressed():
	get_tree().change_scene("res://Instructions.tscn")

func _on_Exit_button_pressed():
	get_tree().quit()
