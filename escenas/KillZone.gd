extends Area2D

# Si el jugador entra 
func _on_body_entered(body):
	if body.is_in_group("player"):
		# Recarga el nivel
		get_tree().reload_current_scene()
