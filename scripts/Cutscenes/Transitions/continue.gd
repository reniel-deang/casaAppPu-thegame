extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.timeline_ended.connect(to_nextScene)
	Dialogic.start("continue")



func to_nextScene():
	if not FileAccess.file_exists(Global.SAVE_FILE):
		print("No save file found!")
		return
		
	var file = FileAccess.open(Global.SAVE_FILE, FileAccess.READ)
	var save_data = JSON.parse_string(file.get_as_text())
	file.close()
	
	if save_data and save_data.has("scene"):
		SceneManager.change_scene(save_data["scene"], {"animation_name_enter": "roll", "pattern_leave": "fade"})
		print("Game Loaded!")
