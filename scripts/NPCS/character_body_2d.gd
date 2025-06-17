extends CharacterBody2D


const speed = 500
var current_direction = "none"
var can_move = true
func _ready() -> void:
	Global.player = self


func _physics_process(delta: float) -> void:
	player_movement(delta)
	
func player_movement(delta):
	
	if Input.is_action_pressed("ui_right"):
		current_direction = "right"

		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_direction = "left"
		
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_direction = "down"
	
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		current_direction = "up"
	
		velocity.x = 0
		velocity.y = -speed
	else:
	
		velocity.x = 0
		velocity.y = 0
		
	
	move_and_slide()
	
