extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.get_name() == "Player":
		Global.cerezas = 0
		Global.damage = true
		print("AAAAAAAAAA")
		get_tree().reload_current_scene()
