extends Node2D

export var mainGameScene : PackedScene
"script"

func _on_Play_button_button_up():
	get_tree().change_scene(mainGameScene.resource_path)
