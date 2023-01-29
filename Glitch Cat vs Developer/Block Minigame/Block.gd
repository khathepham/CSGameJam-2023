extends Area2D

var can_grab = false
var can_move = true
var grabbed_offset = Vector2()
var speed = 5
export var horizontal = true
export var main_block = false

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed && _check_mouse_overlap():
			can_grab = true
			grabbed_offset.x = position.x - get_global_mouse_position().x
			grabbed_offset.y = position.y - get_global_mouse_position().y

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_grab:
		var mouseX = get_global_mouse_position().x
		var mouseY = get_global_mouse_position().y
		if horizontal:
			#var x = get_global_mouse_position().x + grabbed_offset.x
			var width = self.get_node("Block_Hitbox").shape.extents.x
			var x
			#position.x = max(min(x, 1820-width), 650+width)
			if mouseX > position.x:
				x = position.x+speed
			else:
				x = position.x-speed
			position.x = max(min(x, 1520-width), 640+width)
		else:
			#var y = get_global_mouse_position().y + grabbed_offset.y
			var height = self.get_node("Block_Hitbox").shape.extents.y
			var y
			#position.y = max(min(y, 980-height), 100+height)
			
			if mouseY > position.y:
				y = position.y+speed
			else:
				y = position.y-speed
			if can_move:
				position.y = max(min(y, 976-height), 96+height)
			
	if !Input.is_mouse_button_pressed(BUTTON_LEFT):
		can_grab = false
		_snap()
			
func _stop_move():
	can_move = false
	
func _can_move():
	can_move = true
		

func _check_mouse_overlap():
	var mouseX = get_global_mouse_position().x
	var mouseY = get_global_mouse_position().y
	var width = self.get_node("Block_Hitbox").shape.extents.x
	var height = self.get_node("Block_Hitbox").shape.extents.y
	var insideX = mouseX > position.x-width && mouseX < position.x+width
	var insideY = mouseY > position.y-height && mouseY < position.y+height
	if insideX && insideY:
		return true
	return false
	
func _snap():
	if horizontal:
		if main_block:
			var upper = (int(position.x-728)/176)*176
			var lower = upper + 176
			if abs(position.x - 728 - upper) > abs(position.x - 728 - lower):
				position.x = lower + 728
			else:
				position.x = upper + 728
	else:
		var upper = (int(position.y-272)/176)*176
		var lower = upper+176
		if (abs(position.y - 272 - upper) > abs(position.y - 272 - lower)):
			position.y = lower + 272
		else:
			position.y = upper + 272

func _on_Block_area_entered(area):
	area._stop_move()
	area._snap()


func _on_Win_Block_area_entered(area):
	print("you win!")


func _on_Block_area_exited(area):
	area._can_move()
