extends Area2D

@onready var _animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	_animated_sprite.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	



func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.found_egg()
		queue_free()
