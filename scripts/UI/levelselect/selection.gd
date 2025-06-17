extends Control

@onready var player_icon: Node2D = $player_icon

@onready var worlds: Array = [$World_icon, $World_icon2]
var current_world: int = 0
var unlocked_levels: int = 2  # Tracks how many levels are unlocked

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_icon.global_position = worlds[current_world].global_position

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_left") and current_world > 0:
		current_world -= 1
		player_icon.global_position = worlds[current_world].global_position

	elif event.is_action_pressed("ui_right"):
		if current_world < unlocked_levels - 1:
			current_world += 1
			player_icon.global_position = worlds[current_world].global_position

	elif event.is_action_pressed("ui_interact"):
		if current_world < unlocked_levels:  # Ensures only unlocked levels can be selected
			_load_level(current_world)


func _load_level(level: int) -> void:
	var scene_paths = [
		"res://scenes/UI/levelselect/level_select.tscn",
		"res://scenes/UI/levelselect/history_select.tscn",
	]
	
	if level < scene_paths.size():
		SceneManager.change_scene(scene_paths[level], {"animation_name_enter": "roll", "pattern_leave": "fade"})

func _on_back_pressed() -> void:
	SceneManager.change_scene('res://scenes/UI/main_menu.tscn', {"animation_name_enter": "roll", "pattern_leave": "fade"})
