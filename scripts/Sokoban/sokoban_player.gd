extends CharacterBody2D

@onready var ray: RayCast2D = $RayCast2D
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

var grid_size = 32

var inputs = {
	'ui_up': Vector2.UP,
	'ui_down': Vector2.DOWN,
	'ui_left': Vector2.LEFT,
	'ui_right': Vector2.RIGHT,
}

func  _unhandled_input(event: InputEvent) -> void:
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
			print(dir)
			if dir == "ui_up":
				animation.play("back_idle")
			elif dir == 'ui_down':
				animation.play("idle")
			elif dir == 'ui_left':
				animation.flip_h = true
				animation.play("side_idle")
			elif dir == 'ui_right':
				animation.flip_h = false
				animation.play("side_idle")
				
			
			
			
func move(dir):
	var vector_pos = inputs[dir] * grid_size
	ray.target_position = vector_pos
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += vector_pos
	else:
		var collider = ray.get_collider()
		if collider.is_in_group('box'):
			if collider.move(dir):
				position += vector_pos
