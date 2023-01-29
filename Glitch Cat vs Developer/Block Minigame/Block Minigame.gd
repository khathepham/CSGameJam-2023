extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var num = rng.randi_range(1, 2)
	
	var level1 = self.get_node("Level1")
	var level2 = self.get_node("Level2")
	level1.pause = true
	level1.visible = false
	level2.pause = false
	level2.visible = true
	#level2.visible = false
	#if num == 1:
	#	level1.visible = true
	#else:
	#	level2.visible = true
