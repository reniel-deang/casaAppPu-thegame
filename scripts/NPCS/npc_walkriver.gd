extends PathFollow2D
@onready var sprite: AnimatedSprite2D = $walking_npc_2/AnimatedSprite2D


@export var speed: float = 30  # Movement speed

var last_position: Vector2  # Track previous position

func _ready():
	last_position = position  # Initialize last position

func _process(delta):
	progress += speed * delta  # Move along the path
	
	# Get direction based on position change
	var direction = position - last_position
	
	# Change NPC animation based on movement direction
  
	if direction.length() > 0:  # If moving
		if abs(direction.x) > abs(direction.y):  # Moving horizontally
			if direction.x > 0:
				sprite.play("walk_right")  # Walk right animation
			else:
				sprite.play("walk_left")   # Walk left animation
		else:  # Moving vertically
			if direction.y > 0:
				sprite.play("walk_front")   # Walk down animation
			else:
				sprite.play("walk_back")     # Walk up animation
	else:
		sprite.stop()  # Stop animation if no movement

	last_position = position  # Update last position
