extends Node

func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Level1.tscn")


func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Level2.tscn")
	var player = get_node("CharacterBody2D")  # Assuming "Player" is the name of your player node
	if player:
		player.set_gravity(75)  # Gravity specific to Level 2
