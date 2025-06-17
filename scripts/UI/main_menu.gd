extends Node2D

@onready var no_save: Label = $CanvasLayer/no_save
@onready var timer: Timer = $CanvasLayer/Timer


func _on_start_pressed() -> void:
	SceneManager.change_scene('res://scenes/UI/warnings/intro_note.tscn', {"animation_name_enter": "roll", "pattern_leave": "fade"})


func _on_select_pressed() -> void:
	no_save.hide()  # Start hidden
	timer.wait_time = 3.0  # Set timer to 3 seconds (change as needed)
	timer.one_shot = true  # Ensure the timer only runs once per activation
	
	if not FileAccess.file_exists(Global.SAVE_FILE):
		print("No save file found!")
		no_save.show()
		return
		
	SceneManager.change_scene('res://scenes/Cutscenes/TransitionCutscenes/continue.tscn', {"animation_name_enter": "roll", "pattern_leave": "fade"})
	


func _on_timer_timeout() -> void:
	no_save.hide()


func _on_select_level_pressed() -> void:
	SceneManager.change_scene('res://scenes/UI/levelselect/selection_menu.tscn', {"animation_name_enter": "roll", "pattern_leave": "fade"})
