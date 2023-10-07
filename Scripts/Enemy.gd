extends Area2D

@onready var _animated_sprite = $EnemySprite2D
@onready var hero = get_node("../Character")


var detection_range : float = 100.0 #range our enemy can detect our hero in
var chase_range : float = 50.0 #when the enemy will chase the player
var awakened : bool = false
var splooted : bool = false
var chasing : bool = false
var speed : int = 50


func _ready() -> void:
	_animated_sprite.play("sleeping")


func _physics_process(delta) -> void:

	var distance2Hero = global_position.distance_to(hero.global_position);
	if distance2Hero < chase_range:
		chasing = true
		_animated_sprite.play("running")
		var target_position = (hero.position - position).normalized()
		position += target_position * speed * delta
	elif chasing:

		_animated_sprite.play("curious")
		
	if distance2Hero < detection_range && !awakened && !chasing:

		awakened = true
		splooted = false
		_animated_sprite.play("awakened")
	elif distance2Hero > detection_range && !splooted:
		splooted = true
		awakened = false
		chasing = false
		_animated_sprite.play("sploot")



func _on_enemy_sprite_2d_animation_finished() -> void:

	if awakened:
		_animated_sprite.play("curious")
	if splooted:
		_animated_sprite.play("sleeping")

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.hit_enemy()
		var target_position = (hero.position - position).normalized()
		position -= target_position * 30
		
