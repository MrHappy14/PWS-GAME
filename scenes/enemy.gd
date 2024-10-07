# Enemy.gd
extends RigidBody2D

@export var speed: float = 50.0  # Speed of enemy movement
@export var max_distance: float = 400.0  # Maximum distance enemy can walk
var direction: Vector2 = Vector2(1, 0)  # Default movement direction (to the right)
var start_position: Vector2  # Starting position of the enemy


func _ready() -> void:
	start_position = position  # Store the enemy's starting position



func _physics_process(delta: float) -> void:
	var distance_traveled = position.x - start_position.x

	if abs(distance_traveled) >= max_distance:
		direction *= -1  # Reverse direction

	var velocity = direction * speed * delta  # Use delta to adjust for frame rate

	# Move the enemy using move_and_collide()
	var collision = move_and_collide(velocity)

	# Debugging outputs
	print("Enemy at ", position, " moving with velocity ", velocity)

	# Check if a collision happened
	if collision:
		print("Collision detected for enemy at ", position)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name == "CharacterBody2D"):
		var y_delta = position.y - body.position.y
		if (y_delta > 20):
			print("Destroy enemy")
			queue_free()
			body.jump()
		else:
			print("Decrease player health")
			get_tree().reload_current_scene()
