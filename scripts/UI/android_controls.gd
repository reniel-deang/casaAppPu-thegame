extends Node2D


func _on_restart_pressed() -> void:
	SceneManager.change_scene(get_tree().current_scene.scene_file_path, {"animation_name_enter": "roll", "pattern_leave": "fade"})


func _on_skip_pressed() -> void:
	Global.video_stop_requested.emit()
	
