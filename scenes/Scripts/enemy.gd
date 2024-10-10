extends CharacterBody2D

@onready var game_manager: Node = %GameManager

var speed = 50.0
var facing_right = true

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():# Access the root node of the current scene
	var current_scene = get_tree().root.get_child(0)
	
	# Check the scene name or set the gravity based on the scene
	if current_scene.name == "Level 1":
		gravity = 75
	elif current_scene.name == "Level 2":
		gravity = 162
	elif current_scene.name == "Level 3":
		gravity = 371


func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if !$RayCast2D.is_colliding() && is_on_floor():
		flip()
	
	if !$RayCast2D2.is_colliding() && is_on_wall():
		flip()
	
	velocity.x = speed
	move_and_slide()

func flip():
	facing_right = !facing_right
	
	scale.x = abs(scale.x) * -1
	if facing_right:
		speed = abs(speed)
	else:
		speed = abs(speed) * -1

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name == "CharacterBody2D"):
		var y_delta = position.y - body.position.y
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
