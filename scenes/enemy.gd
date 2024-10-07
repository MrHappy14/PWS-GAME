extends RigidBody2D

@export var speed: float = 100.0  # Speed of enemy movement
var direction: Vector2 = Vector2(1, 0)  # Default movement direction (to the right)
var velocity: Vector2 = Vector2(0, 0)  # Initial velocity

func _ready() -> void:
	# Modify movement based on the starting position (optional)
	if position.x > 400:
		direction = Vector2(-1, 0)  # Move left if starting on the right side
	else:
		direction = Vector2(1, 0)   # Move right if starting on the left side

func _physics_process(delta: float) -> void:
	# Set velocity based on direction and speed
	velocity = direction * speed * delta  # Adjust for frame rate by multiplying with delta

	# Move the enemy using move_and_collide()
	var collision = move_and_collide(velocity)

	# If a collision occurs, reverse direction
	if collision:
		direction *= -1  # Reverse the direction when hitting a wall or obstacle


func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name == "CharacterBody2D"):
		var y_delta = position.y - body.position.y
		if (y_delta > 20):
			print("Destroy enemy")
			queue_free()
		else:
			print("Decrease player health")
			get_tree().reload_current_scene()
