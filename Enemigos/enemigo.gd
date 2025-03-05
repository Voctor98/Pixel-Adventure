extends CharacterBody2D

const vel_enemigo = 50
const gravedad = 98

func _ready() -> void:
	velocity.x = vel_enemigo
	$AnimationPlayer.play("walk")
	

func _physics_process(delta):
	velocity.y += gravedad
	
	if is_on_wall():
		if !$Sprite2D.flip_h:
			velocity.x = -vel_enemigo
		else:
			velocity.x = vel_enemigo
	if velocity.x < 0 :
		$Sprite2D.flip_h = true
	elif velocity.x > 0:
		$Sprite2D.flip_h = false
			
			
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		Global.cerezas = 0
		Global.damage = true
		print("AAAAAAAAAA")
		get_tree().reload_current_scene()
