extends Node

@onready var pause: Panel = $PausePanel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var esc_pressed = Input.is_action_just_pressed("pause")
	if (esc_pressed ==  true):
		get_tree().paused = true
		pause.show()


func _on_resume_pressed() -> void:
	pause.hide()
	get_tree().paused = false


func _on_main_menu_pressed() -> void:
	get_tree().paused = false 
	get_tree().change_scene_to_file("res://scenes/Schermen/main menu.tscn")

func _on_pressed() -> void:
	get_tree().quit()


func _on_quit_3_pressed() -> void:
	get_tree().quit()
