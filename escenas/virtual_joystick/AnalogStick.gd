extends TouchScreenButton

var analogStickEn: bool = false
var detectionRadius: float = 80
var stickRadius: Vector2 = Vector2(40,40)
func _ready():
	detectionRadius = get("shape").get("radius")
	print(detectionRadius)

func _input(event):
	if event is InputEventScreenDrag and analogStickEn:
		var value:Vector2 = (event.position-position)/(detectionRadius*scale)
		value.x = clamp(value.x,-1.0,1.0)
		value.y = clamp(value.y,-1.0,1.0)
		update_stick_draw(value)
		if value.x < 0:
			Input.action_press("ui_left",-value.x)
		if value.x >= 0:
			Input.action_press("ui_right",value.x)


func update_stick_draw(newPosition: Vector2):
	if newPosition.length()>1:
		%LStick.position = newPosition.normalized()*(detectionRadius)
	else:
		%LStick.position = newPosition*(detectionRadius)

func _on_pressed():
	analogStickEn = true

func _on_released():
	analogStickEn = false
	update_stick_draw(Vector2.ZERO)
	Input.action_release("ui_right")
	Input.action_release("ui_left")
