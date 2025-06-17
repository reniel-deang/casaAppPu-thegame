extends Node2D


@onready var show_place: Node2D = $android_controls/Texts/show_place
@onready var timer: Timer = $android_controls/Texts/Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show_place.show()
	timer.wait_time = 5.0  # Set timer to 3 seconds (change as needed)
	timer.one_shot = true  
	timer.start()


func _on_to_river_body_entered(_body: Node2D) -> void:
	SceneManager.change_scene('res://scenes/Main/game.tscn', {"animation_name_enter": "roll", "pattern_leave": "fade"})


func _on_timer_timeout() -> void:
	show_place.hide()
	
