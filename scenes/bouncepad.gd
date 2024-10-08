extends Node2D

@export var jump_height = -500.0

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name == "CharacterBody2D"):
		body.velocity.y = jump_height
