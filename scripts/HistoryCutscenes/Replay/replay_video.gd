extends Node2D

func _on_restartvideo_pressed() -> void:
	SceneManager.change_scene(get_tree().current_scene.scene_file_path, {"animation_name_enter": "roll", "pattern_leave": "fade"})


func _on_back_pressed() -> void:
	SceneManager.change_scene("res://scenes/UI/levelselect/history_select.tscn", {"animation_name_enter": "roll", "pattern_leave": "fade"})
