extends KinematicBody2D

var can_grab = false
var is_dragging = false;
var grabbed_offset = Vector2()
export var horizontal = true

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed && _check_mouse_overlap():
			can_grab = true
			if horizontal:
				grabbed_offset = position.x - get_global_mouse_position().x
			else:
				grabbed_offset = position.y - get_global_mouse_position().y
				
	
		
func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_grab:
		if horizontal:
			var x = get_global_mouse_position().x + grabbed_offset
			var width = self.get_node("CollisionShape2D").shape.extents.x
			position.x = max(min(x, 1820-width), 650+width)
		else:
			var y = get_global_mouse_position().y + grabbed_offset
			var height = self.get_node("CollisionShape2D").shape.extents.y
			position.y = max(min(y, 980-height), 100+height)
	if (!Input.is_mouse_button_pressed(BUTTON_LEFT)):
		can_grab = false
			
func _check_mouse_overlap():
	var mouseX = get_global_mouse_position().x
	var mouseY = get_global_mouse_position().y
	var width = self.get_node("CollisionShape2D").shape.extents.x
	var height = self.get_node("CollisionShape2D").shape.extents.y
	var insideX = mouseX > position.x-width && mouseX < position.x+width
	var insideY = mouseY > position.y-height && mouseY < position.y+height
	if insideX && insideY:
		return true
	return false


func _on_CenterBlock_area_entered(area):
	
