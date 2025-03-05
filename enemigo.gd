extends CharacterBody2D
class_name Enemigo

var speed := 120
var direccion := 0.0
const gravity := 9


@onready var anim := $AnimationPlayer
@onready var sprite := $Sprite2D

func _physics_process(delta: float) -> void:
	_ready()

func _ready():
	
	if direccion != 0:
		anim.play("caminar_enemigo")
	else: 
		anim.play("enemigo_animation")
		
	sprite.flip_h = direccion < 0 if direccion != 0 else sprite.flip_h

func _process(delta: float) -> void:
	enemigo_movimiento()

func enemigo_movimiento():
	velocity.y += gravity
	velocity.x = -speed
	
	speed = move_and_slide()
