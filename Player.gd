extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animation:= $Sprite2D as AnimatedSprite2D
var is_junp:=false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		is_junp=true
	elif is_on_floor():
			is_junp =false
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction !=0:
		velocity.x = direction * SPEED
		animation.scale.x=direction
		if !is_junp:
			animation.play("run")
	elif is_junp:
		animation.play("junp")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animation.play("stop")

	move_and_slide()
