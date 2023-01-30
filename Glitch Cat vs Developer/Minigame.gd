extends Area2D

export var scene : PackedScene

var complete = false
var interactable = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$MinigameSprite.texture = load("res://assets/node.png")
	modulate = Color(1,1,1)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	print(interactable)
	if interactable && Input.is_action_just_pressed("interact"):
		complete = true
		print("play")
		get_tree().change_scene_to(scene)

func _on_Minigame_body_entered(_body):
	interactable = true
	print("interactable")
	if !complete:
		modulate = Color(1.5,1.5,1.5)


func _on_Minigame_body_exited(_body):
	interactable = false
	print("exit")
	modulate = Color(1,1,1)
	if !complete:
		emit_signal("complete")
	
func _on_Minigame_complete():
	$MinigameSprite.texture = load("res://assets/frayed node.png")
	complete = true
