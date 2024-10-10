extends Node

func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Schermen/level_1.tscn")


func _on_level_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Schermen/Level_2.tscn")


func _on_level_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Schermen/level_3.tscn")
