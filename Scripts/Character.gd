extends CharacterBody2D

var move_speed : float = 75
var current_direction : String = "right"
var is_looping : bool = true
var eggs_collected : int = 0
var health : int = 3;

const max_health : int = 5;

var bg_music := AudioStreamPlayer.new()

@onready var carrots = [
	get_node("CanvasLayer/CarrotHealth5"),
	get_node("CanvasLayer/CarrotHealth4"),
	get_node("CanvasLayer/CarrotHealth3"),
	get_node("CanvasLayer/CarrotHealth2"),
	get_node("CanvasLayer/CarrotHealth"),
]



@onready var score_text : Label = get_node("CanvasLayer/Score")

@onready var _animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	velocity.x = 0
	velocity.y = 0
	#using an elif structure to avoid diagonals
	if Input.is_key_pressed(KEY_LEFT) || Input.is_key_pressed(KEY_A):
		is_looping = true
		_animated_sprite.play("walk_left")
		current_direction = "left"
		velocity.x -= move_speed
		
	elif Input.is_key_pressed(KEY_RIGHT) || Input.is_key_pressed(KEY_D):
		is_looping = true
		_animated_sprite.play("walk_right")
		current_direction = "right"
		velocity.x += move_speed 
		
	elif Input.is_key_pressed(KEY_DOWN) || Input.is_key_pressed(KEY_S):
		is_looping = true
		_animated_sprite.play("walk_down")
		current_direction = "down"
		velocity.y += move_speed
		
	elif Input.is_key_pressed(KEY_UP) || Input.is_key_pressed(KEY_W):
		is_looping = true
		_animated_sprite.play("walk_up")
		current_direction = "up"
		velocity.y -= move_speed
	
	#attack
	elif Input.is_key_pressed(KEY_SPACE):
		is_looping = false
		_animated_sprite.play(str("attack_",current_direction))

	else:
		if is_looping:
			_animated_sprite.stop()
	
	move_and_slide()

func found_egg() :
	eggs_collected+=1
	score_text.text = str("Eggs Found: ", eggs_collected)
	
func _ready():
	for n in max_health:
		if n >= health:
			carrots[n].full()
		else:
			carrots[n].eaten()
	
	bg_music.stream = load("res://Music/Elven Lulliby Two Instruments.ogg")
	bg_music.autoplay = true
	add_child(bg_music)
	print(bg_music.get_volume_db())
	bg_music.set_volume_db(-8.0)
