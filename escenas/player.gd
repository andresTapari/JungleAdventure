extends CharacterBody2D			# Heredamos metodos del Nodo: CharacterBody2D

# Definimos variables:
@export var SPEED : float = 150.0				# Velocidad del personaje
@export var JUMP_VELOCITY : float = -300.0		# Velocidad de salto
@export var DECELERATION  : float = 100			# Desaceleración

# Definimos la gravedad:
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Agregamos velocidad al movimiento
	if not is_on_floor():
		velocity.y += gravity * delta

	# Administramos el salto
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Obtenemos la dirección de entrada
	var direction = Input.get_axis("ui_left", "ui_right")	# devuelve -1,0 o 1
	
	# Si la dirección no es cero:
	if direction:
		# Velocity es direccion por la velocidad
		velocity.x = direction * SPEED
	else:
		# Velocity desacelera hasta cero 
		velocity.x = move_toward(velocity.x, 0, DECELERATION)
	
	# Actualizamos animación
	if velocity == Vector2.ZERO:
		$AnimatedSprite2D.play("idle")
	if velocity.x != 0 and velocity.y == 0:
		$AnimatedSprite2D.set("flip_h",velocity.x < 0)
		$AnimatedSprite2D.play("run")
	if velocity.y < 0:
		$AnimatedSprite2D.play("jump")
	elif velocity.y > 0:
		$AnimatedSprite2D.play("fall")
		
	# movemos al personaje
	move_and_slide()
