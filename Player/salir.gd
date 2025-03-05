extends Button

# Se llama cuando el botón es presionado
func _pressed() -> void:
	print("Botón Salir presionado, cerrando el juego...")
	get_tree().quit()  # Cierra el juego completamente
