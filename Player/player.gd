extends CharacterBody2D
class_name Player

var speed := 120
var direccion := 0.0
var jump := 250
const gravity := 9

var checkpoint := Vector2.ZERO  # Última posición segura
var bananas_recogidas := 0  # Contador de bananas
const BANANAS_PARA_CHECKPOINT := 10  # Número de bananas necesarias para guardar checkpoint

@onready var anim := $AnimationPlayer
@onready var sprite := $Sprite2D
@onready var cerezaLabel := $PlayerGUI/HBoxContainer/CerezasLabel

func _ready():
	Global.player = self

@warning_ignore("unused_parameter")
func _physics_process(delta):
	direccion = Input.get_axis("ui_left", "ui_right")
	velocity.x = direccion * speed

	if direccion != 0:
		anim.play("walk")
	else:
		anim.play("idle")

	sprite.flip_h = direccion < 0 if direccion != 0 else sprite.flip_h

	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y -= jump
		$AudioStreamPlayer.play()

	if !is_on_floor():
		velocity.y += gravity

	move_and_slide()

func actualizaInterfazCerezas():
	cerezaLabel.text = str(Global.cerezas)

func recoger_banana():
	bananas_recogidas += 1
	print("🍌 Banana recogida! Total: ", bananas_recogidas)

	if bananas_recogidas >= BANANAS_PARA_CHECKPOINT:
		checkpoint = global_position  # Guarda la posición del checkpoint
		bananas_recogidas = 0  # Reinicia el contador
		print("✅ CHECKPOINT ACTIVADO en: ", checkpoint)
		mostrar_mensaje_checkpoint()

func mostrar_mensaje_checkpoint():
	var label = Label.new()
	label.text = "✅ CHECKPOINT ALCANZADO"
	label.set_position(Vector2(50, 50))  # Ajusta la posición en pantalla
	label.set("theme_override_colors/font_color", Color(1, 1, 0))  # Color amarillo
	label.set("theme_override_font_sizes/font_size", 24)  # Tamaño grande
	
	get_tree().current_scene.add_child(label)  # Añade el mensaje a la escena
	
	await get_tree().create_timer(2).timeout  # Espera 2 segundos
	label.queue_free()  # Borra el mensaje después de mostrarlo

func _on_pinchos_body_entered(body: Node2D) -> void:
	if body is Player:
		Global.cerezas = 0
		Global.damage = true
		print("💀 Jugador murió. Checkpoint actual: ", checkpoint)
		
		if checkpoint != Vector2.ZERO:
			print("🔄 Reapareciendo en checkpoint en posición: ", checkpoint)
			await get_tree().create_timer(0.2).timeout  # Pausa antes de reaparecer
			global_position = checkpoint  # Mueve al jugador al último checkpoint
		else:
			print("❌ No hay checkpoint, reiniciando escena")
			get_tree().reload_current_scene()
