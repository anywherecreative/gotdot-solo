extends CharacterBody2D

@export var move_speed : float = 30.0

@onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	if Input.is_key_pressed(KEY_LEFT) || Input.is_key_pressed(KEY_A):
		_animated_sprite.play("walk_left")
		global_position.x -= move_speed * delta
		
	elif Input.is_key_pressed(KEY_RIGHT) || Input.is_key_pressed(KEY_D):
		_animated_sprite.play("walk_right")
		global_position.x += move_speed * delta
		
	elif Input.is_key_pressed(KEY_DOWN) || Input.is_key_pressed(KEY_S):
		_animated_sprite.play("walk_down")
		global_position.y += move_speed * delta
		
	elif Input.is_key_pressed(KEY_UP) || Input.is_key_pressed(KEY_W):
		_animated_sprite.play("walk_up")
		global_position.y -= move_speed * delta
		
	else:
		_animated_sprite.stop()
		
	
