extends Node

var cerezas := 0:
	set(val):
		cerezas = val
		if player != null:
			player.actualizaInterfazCerezas() # Actualiza el dato de cerezas recolectadas
			if sonido_activado:  # Solo reproduce sonido si está activado
				$CerezaSonido.play()
	get:
		return cerezas
		
var player

var damage := true:
	set(val2):
		damage = val2
		if player != null:
			$CerezaSonido.playing = false
			if sonido_activado:
				$HitAudio.play()

# Nueva variable para controlar el sonido
var sonido_activado := true  

func toggle_sonido():
	sonido_activado = !sonido_activado
	print("🔊 Sonido activado: ", sonido_activado)
