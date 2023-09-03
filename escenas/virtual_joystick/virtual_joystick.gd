extends CanvasLayer

var lStickIsPressed: bool = false
var l_stick_dimension_offset = Vector2(16,16)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event is InputEventScreenDrag and lStickIsPressed:
		print("Touch_position",event.position)
		update_screen_l_stick_touch(event.position)

func update_screen_l_stick_touch(newPos: Vector2) -> void:
	var touchPosition: Vector2 = newPos - %TextureRect.get_parent().global_position - l_stick_dimension_offset
	var centerPosition: Vector2 = $TouchScreenButton_L_stick/Center.get("global_position")
	
	print("Center_position:",centerPosition)
	var dir: Vector2 =(newPos - centerPosition)/63.0
	Input.action_press("ui_left",dir.x)
	Input.action_press("ui_right",dir.x)
	%TextureRect.set("position", touchPosition)

func _on_touch_screen_button_l_stick_pressed():
	lStickIsPressed = true


func _on_touch_screen_button_l_stick_released():
	lStickIsPressed = false


func _on_touch_screen_button_a_pressed():
	Input.action_press("ui_accept")
