extends CharacterBody2D

@onready var _animated_sprite = $EnemySprite2D
@onready var hero = get_node("../Character")


var detection_range : float = 100.0 #range our enemy can detect our hero in
var chase_range : float = 50.0 #when the enemy will chase the player
var awakened : bool = false
var splooted : bool = false
var speed : int = 50


func _ready():
	_animated_sprite.play("sleeping")


func _physics_process(delta):
	var distance2Hero = global_position.distance_to(hero.global_position);
	if distance2Hero < chase_range:
		var target_position = (hero.position - position).normalized()
		position += target_position * speed * delta
		
	if distance2Hero < detection_range && !awakened:
		awakened = true
		splooted = false
		_animated_sprite.play("awakened")
	elif distance2Hero > chase_range && !splooted:
		splooted = true
		awakened = false
		_animated_sprite.play("sploot")



func _on_enemy_sprite_2d_animation_finished():
	if awakened:
		_animated_sprite.play("curious")
	if splooted:
		_animated_sprite.play("sleeping")
