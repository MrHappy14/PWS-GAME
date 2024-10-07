# Enemy.gd
extends RigidBody2D

@export var speed: float = 50.0  # Speed of enemy movement
@export var max_distance: float = 400.0  # Maximum distance enemy can walk



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
