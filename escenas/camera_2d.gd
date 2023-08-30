extends Camera2D

@export var target_path: NodePath			# Path a target
@export var follow_speed: float  = 2.5		# Velocidad de la cámara

var target: CharacterBody2D					# Taget a seguir

# Esta función se ejecuta cuando el nodo es agreado al arból de escena
func _ready():
	# Si target_path no esta vacio
	if not target_path.is_empty():
		# Cargamos en target a player
		target = get_node(target_path)

# Esta función se llama por cada fotograma
func _process(delta):
	if target:
		var target_position = target.global_position
		global_position = global_position.lerp(target_position,\
		follow_speed * delta)
