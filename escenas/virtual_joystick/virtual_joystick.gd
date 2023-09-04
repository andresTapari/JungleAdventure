extends CanvasLayer

func _on_touch_screen_button_a_pressed():
	Input.action_press("ui_accept")


func _on_check_box_toggled(button_pressed):
	%TouchScreenButton_L_stick.set("visible",button_pressed)
	%TouchScreenButton_A.set("visible",button_pressed)
