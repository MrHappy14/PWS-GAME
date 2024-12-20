extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -160.0
@onready var sprite_2d = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func jump():
	velocity.y = JUMP_VELOCITY

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
	#Animations
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "running"
	else:
		sprite_2d.animation = "default"
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "jumping"

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 20)

	move_and_slide()
	
	if Input.is_action_just_pressed("left"):
		sprite_2d.flip_h = true
		
	if Input.is_action_just_pressed("right"):
		sprite_2d.flip_h = false
