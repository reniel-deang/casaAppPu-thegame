extends CharacterBody2D


const speed = 40
var current_direction = "none"
var can_move = true
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D


func _ready() -> void:
	Global.player = self


func _physics_process(delta: float) -> void:
	player_movement(delta)
	
func player_movement(_delta):
	
	if !can_move:
		velocity = Vector2.ZERO
		play_animation(0)
		return
		
	if Input.is_action_pressed("ui_right"):
		current_direction = "right"
		play_animation(1)
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_direction = "left"
		play_animation(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_direction = "down"
		play_animation(1)
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		current_direction = "up"
		play_animation(1)
		velocity.x = 0
		velocity.y = -speed
	else:
		play_animation(0)
		velocity.x = 0
		velocity.y = 0
		
	if velocity != Vector2.ZERO:
		ray_cast_2d.target_position = velocity.normalized() * 50
		
	move_and_slide()
		
	
	

func play_animation(movement):
	var dir = current_direction
	
	
	if dir == "right":
		animated_sprite.flip_h = false
		if movement == 1:
			animated_sprite.play("side_walk")
		elif movement == 0:
			animated_sprite.play("side_idle")
	
	elif dir == "left":
		animated_sprite.flip_h = true
		if movement == 1:
			animated_sprite.play("side_walk")
		elif movement == 0:
			animated_sprite.play("side_idle")
			
	elif dir == "up":
		if movement == 1:
			animated_sprite.play("back_walk")
		elif movement == 0:
			animated_sprite.play("back_idle")
			
	elif dir == "down":
		if movement == 1:
			animated_sprite.play("front_walk")
		elif movement == 0:
			animated_sprite.play("front_idle")
			

func _input(event: InputEvent) -> void:
	if can_move:
		if event.is_action_pressed("ui_interact"):
			var target = ray_cast_2d.get_collider()
			if target != null:
				if target.is_in_group("NPC") || target.is_in_group("SIGNS"):
					print("Im Talking to NPC")
					can_move = false
					target.start_dialog()
					await Dialogic.timeline_ended
					can_move = true
	
	
