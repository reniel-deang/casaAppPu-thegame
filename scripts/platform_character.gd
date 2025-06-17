extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


@export var SPEED = 150.0
@export var JUMP_VELOCITY = -440.0



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_interact") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	#Get the input direction. It can be -1, 0, 1
	var direction := Input.get_axis("ui_left", "ui_right")
	
	#check if if its moving right
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif  direction < 0:
		animated_sprite_2d.flip_h = true
		
	
	if is_on_floor():
		#Play Animations based on the animated sprite and created animations
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("walk")
	else:
		animated_sprite_2d.play("jump")
	
	
	#Apply the movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
