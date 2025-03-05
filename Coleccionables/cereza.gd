extends Area2D
#Desaparecer cuando lo toca el jugador
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		Global.cerezas += 1
		queue_free() #Destruye el objeto
