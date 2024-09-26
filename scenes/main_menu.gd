extends Node


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Level Menu.tscn")
	# Global.gd


func _on_quit_pressed() -> void:
	get_tree().quit()
