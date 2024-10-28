extends CharacterBody2D

@onready var game_manager: Node = %GameManager

var speed = 50.0
var facing_right = true

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	# Access the current scene
	var current_scene = get_tree().current_scene
	
	# Check if the current scene exists and get its name
	if current_scene != null:
		if current_scene.name == "Level 1":
			gravity = 75
		elif current_scene.name == "Level 2":
			gravity = 162
		elif current_scene.name == "Level 3":
			gravity = 371
	else:
		print("Error: No current scene loaded")


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

func flip():
	facing_right = !facing_right
	
	scale.x = abs(scale.x) * -1
	if facing_right:
		speed = abs(speed)
	else:
		speed = abs(speed) * -1

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name == "CharacterBody2D"):
		var y_delta = abs(position.y - body.position.y)
		print(y_delta)
		if (y_delta > 20):
			print("Destroy enemy")
			queue_free()
			body.jump()
			game_manager.add_point()
		else:
			print("kill player")
			get_tree().reload_current_scene()
	
	if "Enemy" in body.name:
		flip()
