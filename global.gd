extends Node

var cerezas := 0:
	set(val):
		cerezas = val
		if player != null:
			player.actualizaInterfazCerezas() #Actualiza el dato de cerezas recolectados
			$CerezaSonido.play() #Activar sonido de colectar
	get:
		return cerezas
		
var player

var damage := true:
	set(val2):
		damage = val2
		if player != null:
			$CerezaSonido.playing = false
			$HitAudio.play()
