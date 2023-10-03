extends CharacterBody2D

@export var move_speed : float = 30.0
var current_direction : String = "right"
var is_looping : bool = true

@onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	#using an elif structure to avoid diagonals
	if Input.is_key_pressed(KEY_LEFT) || Input.is_key_pressed(KEY_A):
		is_looping = true
		_animated_sprite.play("walk_left")
		current_direction = "left"
		global_position.x -= move_speed * delta
		
	elif Input.is_key_pressed(KEY_RIGHT) || Input.is_key_pressed(KEY_D):
		is_looping = true
		_animated_sprite.play("walk_right")
		current_direction = "right"
		global_position.x += move_speed * delta
		
	elif Input.is_key_pressed(KEY_DOWN) || Input.is_key_pressed(KEY_S):
		is_looping = true
		_animated_sprite.play("walk_down")
		current_direction = "down"
		global_position.y += move_speed * delta
		
	elif Input.is_key_pressed(KEY_UP) || Input.is_key_pressed(KEY_W):
		is_looping = true
		_animated_sprite.play("walk_up")
		current_direction = "up"
		global_position.y -= move_speed * delta
	
	#attack
	elif Input.is_key_pressed(KEY_SPACE):
		is_looping = false
		_animated_sprite.play(str("attack_",current_direction))

	else:
		if is_looping:
			_animated_sprite.stop()
		

	
