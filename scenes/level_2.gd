extends Node

@export var enemy_scene: PackedScene  # Assign Enemy.tscn in the Inspector
@export var spawn_positions: Array[Vector2] = [
	Vector2(100, 200),
	Vector2(300, 200),
	Vector2(500, 200),
	Vector2(700, 200)
]

func _ready() -> void:
	if enemy_scene == null:
		print("Error: enemy_scene is not assigned!")
		return
	
	# Spawn enemies at predefined positions
	for position in spawn_positions:
		spawn_enemy(position)

func spawn_enemy(position: Vector2) -> void:
	var enemy = enemy_scene.instantiate()  # Create an instance of the enemy
	add_child(enemy)                       # Add the enemy to the scene tree
	enemy.position = position              # Set the enemy's position after adding it to the tree
	print("Spawned enemy at: ", position)  # Debug output to check positions
