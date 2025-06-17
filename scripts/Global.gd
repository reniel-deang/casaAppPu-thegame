extends Node

signal video_stop_requested  # Define the signal

var current_level: int = 0
var current_history_level: int = 0
var player: Node = null

const SAVE_FILE = "user://save_game.json"
const SAVE_FILE_UNLOCK = "user://save_unlock.json"

# Function to load saved data (if exists)
func load_save():
	if FileAccess.file_exists(SAVE_FILE_UNLOCK):
		var file = FileAccess.open(SAVE_FILE_UNLOCK, FileAccess.READ)
		var content = file.get_as_text()
		file.close()

		var save_data = JSON.parse_string(content)
		if save_data is Dictionary:
			current_level = save_data.get("current_level", 0)
			current_history_level = save_data.get("current_history_level", 0)
			print("Loaded Save: Current Level:", current_level, "History Level:", current_history_level)

# Function to update save data
func update_save():
	var save_data_unlock = {
		"current_level": current_level,
		"current_history_level": current_history_level
	}

	var file = FileAccess.open(SAVE_FILE_UNLOCK, FileAccess.WRITE)
	file.store_string(JSON.stringify(save_data_unlock, "\t"))  # Store as readable JSON
	file.close()
	print("Game Saved! Current Level:", current_level, "History Level:", current_history_level)

# Function to update levels only if the new values are greater
func update_level(new_level: int, new_history_level: int):
	# Load existing values first
	load_save()
	
	# Update only if new values are greater
	if new_level > current_level:
		current_level = new_level

	if new_history_level > current_history_level:
		current_history_level = new_history_level

	# Save if there was an update
	update_save()
