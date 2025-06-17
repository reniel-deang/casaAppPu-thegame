extends Area2D

@onready var timer: Timer = $Timer
@onready var show_failed: Label = $"../android_controls/Animated_Text/Texts/show_failed"


func _on_body_entered(body: Node2D) -> void:
	print("you died!") # Replace with function body.
	show_failed.show()
	Engine.time_scale = 0.5
	timer.start()



func _on_timer_timeout() -> void:
	show_failed.hide()
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
