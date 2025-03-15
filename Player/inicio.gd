extends Button

# Variable para controlar el estado del sonido
var sound_on : bool = true  # Cambia este valor a `false` si deseas iniciar sin sonido

func _ready() -> void:
	# Conectar la señal cuando el botón sea presionado
	pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	print("Cargando escena de juego...")

	# Comprobar si el sonido está activado
	if sound_on:
		# Aquí puedes poner el código para iniciar el sonido si es necesario
		# Por ejemplo, si tienes un AudioStreamPlayer, puedes activarlo aquí:
		# var audio_player = get_node("AudioStreamPlayer")
		# audio_player.play()
		print("Sonido ACTIVADO")
	else:
		# Detener el sonido si está desactivado
		# Si tienes un AudioStreamPlayer, puedes detenerlo aquí:
		# var audio_player = get_node("AudioStreamPlayer")
		# audio_player.stop()
		print("Sonido DESACTIVADO")

	# Cambiar la escena
	get_tree().change_scene_to_file("res://Player/world.tscn")
