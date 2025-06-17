extends CharacterBody2D

var directions = [Vector2.UP, Vector2.DOWN, Vector2.LEFT, Vector2.RIGHT]  
var speed = 40
var move_time = 2.0
var change_direction_timer = 0
var is_paused = false  # Prevents movement during pause

@onready var sprite = $AnimatedSprite2D  # Adjust based on your node name

func _process(delta):
	if is_paused:
		return  # Stop movement when paused
	
	change_direction_timer -= delta
	if change_direction_timer <= 0:
		change_direction_timer = move_time + randf_range(0, 1.5)  # Add variation
		move_random_direction()

	# Attempt to move
	var collision = move_and_slide()
	if collision:
		stop_and_change_direction()

func move_random_direction():
	var direction = directions[randi() % directions.size()]
	velocity = direction * speed
	play_animation(direction)

func stop_and_change_direction():
	if is_paused:
		return  # Prevent multiple pauses

	is_paused = true
	velocity = Vector2.ZERO  # Stop movement
	sprite.play("idle")  # Play idle animation

	await get_tree().create_timer(0.7).timeout  # Pause for 0.7 seconds

	# Pick a valid new direction
	var new_direction
	while true:
		new_direction = directions[randi() % directions.size()]
		if new_direction != velocity.normalized():  # Avoid repeating the same stuck direction
			break
	
	velocity = new_direction * speed  # Apply new direction
	is_paused = false
	play_animation(new_direction)

func play_animation(direction):
	if direction == Vector2.UP:
		sprite.play("walk_back")
	elif direction == Vector2.DOWN:
		sprite.play("walk_front")
	elif direction == Vector2.LEFT:
		sprite.play("walk_left")
	elif direction == Vector2.RIGHT:
		sprite.play("walk_right")
	else:
		sprite.play("idle")  # Play idle animation when not moving
