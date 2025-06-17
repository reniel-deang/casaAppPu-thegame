extends Node2D
@onready var timer: Timer = $Timer
@onready var seizure_warning: Label = $CanvasLayer/seizure_warning


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	SceneManager.change_scene('res://scenes/UI/main_menu.tscn', {"animation_name_enter": "roll", "pattern_leave": "fade"})
