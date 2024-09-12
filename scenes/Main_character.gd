extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -160.0
@onready var sprite_2d = $Sprite2D

var gravity: int = ProjectSettings.get("physics/2d/default_gravity")  # Default gravity

# Method to set gravity
func set_gravity(gravity_value: int):
	gravity = gravity_value
	print("Gravity set to: ", gravity)

func _ready():
	# Make sure to call set_gravity when level is loaded
	set_gravity(gravity)

func _physics_process(delta):
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
