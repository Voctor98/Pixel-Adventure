extends Button

func _ready() -> void:
	# Conectar la señal cuando el botón sea presionado
	pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	print("Cargando escena de juego...")
	get_tree().change_scene_to_file("res://Player/world.tscn")  # Usa change_scene_to_file en Godot 4
