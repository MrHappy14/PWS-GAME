extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -160.0
@onready var sprite_2d = $Sprite2D

var gravity: int = ProjectSettings.get("physics/2d/default_gravity")  # Default gravity

func _physics_process(delta):
	var root_name = get_tree().root.get_child(0).name
	var current_level = 1
	
	if root_name == "Level1":
		current_level == 1
	elif root_name == "Level2":
		current_level = 2
	
	if (current_level == 2):
		gravity = 75

	# Handle animations
	if (velocity.x > 1 or velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "jumping"

	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Handle horizontal movement
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 20)

	move_and_slide()

	# Flip sprite based on movement direction
	if Input.is_action_just_pressed("left"):
		sprite_2d.flip_h = true
	if Input.is_action_just_pressed("right"):
		sprite_2d.flip_h = false
