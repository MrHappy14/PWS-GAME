extends Node2D

func _ready():
	var player = get_node("CharacterBody2D")  # Assuming "Player" is the name of your player node
	if player:
		player.set_gravity(75)  # Gravity specific to Level 2
	var current_level = 2
