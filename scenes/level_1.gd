extends Node


@export var enemy_scene: PackedScene  # Assign Enemy.tscn in the Inspector
@export var spawn_positions: Array[Vector2] = [
	Vector2(1259, 377),
	Vector2(300, 400),
	Vector2(500, 150),
	Vector2(700, 350)
]  # Specific positions to spawn enemies


func _ready() -> void:
	# Check if enemy_scene is assigned properly before trying to spawn enemies
	if enemy_scene == null:
		print("Error: enemy_scene is not assigned!")
		return
	
	# Spawn enemies at predefined positions
	for position in spawn_positions:
		spawn_enemy(position)

# Function to instantiate and place enemy at a specific position
func spawn_enemy(position: Vector2) -> void:
	var enemy = enemy_scene.instantiate()  # Correctly create an instance of the enemy
	add_child(enemy)                       # Add the enemy to the scene tree BEFORE setting position
	enemy.position = position              # Now set the enemy's position after adding it to the tree
		# Add the enemy to the scene tree
