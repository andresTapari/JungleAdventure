extends Area2D

@onready var animationSprite = get_node("AnimatedSprite2D")

func _on_body_entered(body):
	# Si body es player
	if body.is_in_group("player"):
		# reproducimos animación out
		$AnimatedSprite2D.play("out")
		# Esperamos a que termine la animacion
		await $AnimatedSprite2D.animation_finished
		# Elimiamos el nodo
#		queue_free()
		# Cambamos escena
		get_tree().change_scene_to_file("res://escenas/endGame.tscn")
