extends ParallaxBackground

# Speed of scrolling (pixels per second)
var scroll_speed = 50

# Update function to move the parallax background automatically
func _process(delta):
	scroll_base_offset += Vector2(100, 0) * delta
