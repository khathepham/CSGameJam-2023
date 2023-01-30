extends KinematicBody2D


# Declare member variables here. Examples:
export var speed = 2000 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
onready var _animated_sprite = $AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		_animated_sprite.play("right")
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		_animated_sprite.play("left")
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		_animated_sprite.play("down")
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		_animated_sprite.play("up")
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
#	position += velocity * delta
	move_and_collide(velocity * delta)



#if velocity.x != 0:
#    $AnimatedSprite.animation = "walk"
#    $AnimatedSprite.flip_v = false
#    # See the note below about boolean assignment.
#    $AnimatedSprite.flip_h = velocity.x < 0
#elif velocity.y != 0:
#    $AnimatedSprite.animation = "up"
#    $AnimatedSprite.flip_v = velocity.y > 0
