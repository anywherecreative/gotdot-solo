extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		_animated_sprite.play("walk_left")
	else:
		_animated_sprite.stop()
