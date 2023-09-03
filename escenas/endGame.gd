extends Control


func _on_button_pressed():
	# Cambiamos la escena actual al fin del nivel
	get_tree().change_scene_to_file("res://escenas/lvl.tscn")

