extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Exporteer een variabele voor de spawnlocatie van de speler
@export var player_spawn_position: Vector2

# Referentie naar de speler node
@onready var player = get_tree().get_root().find_node("CharacterBody2D", true, false)

# Signaal verbonden met de body_entered van Area2D
func	_on_area_entered(body:Node):	
	# Controleer of de speler het lichaam is dat binnenkomt
	if body == player:
		# Stel de positie van de speler terug naar de spawnlocatie
			body.global_position = player_spawn_position
