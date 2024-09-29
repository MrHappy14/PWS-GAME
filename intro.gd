extends Node

func _ready():
	
	$AnimationPlayer.play("Fade in")
	await(get_tree().create_timer(6))
	$AnimationPlayer.play("Fade out")
	await(get_tree().create_timer(6))
	get_tree().change_scene_to_file("res://scenes/main.tscn")
