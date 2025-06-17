extends Control

@onready var timer: Timer = $"../../Timer"
@onready var unlock_level: Label = $"../Texts/unlock_level"
@onready var player_icon: Node2D = $player_icon

@onready var worlds: Array = [$history_icon, $history_icon2, $history_icon3, $history_icon4, $history_icon5,
$history_icon6, $history_icon7, $history_icon8]
var current_world: int = 0
var unlocked_levels: int = Global.current_history_level  # Tracks how many levels are unlocked

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_icon.global_position = worlds[current_world].global_position
	unlock_level.hide()  # Hide the message at the start

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_left") and current_world > 0:
		current_world -= 1
		player_icon.global_position = worlds[current_world].global_position

	elif event.is_action_pressed("ui_right"):
		if current_world < unlocked_levels - 1:
			current_world += 1
			player_icon.global_position = worlds[current_world].global_position
		else:
			_show_locked_message()

	elif event.is_action_pressed("ui_interact"):
		if current_world < unlocked_levels:  # Ensures only unlocked levels can be selected
			_load_level(current_world)

func _show_locked_message() -> void:
	unlock_level.show()
	timer.start()  # Start timer to hide message after timeout

func _load_level(level: int) -> void:
	var scene_paths = [
		"res://scenes/HistoryCutscenes/Replay/replay_history_1.tscn",
		"res://scenes/HistoryCutscenes/Replay/replay_history_2.tscn",
		"res://scenes/HistoryCutscenes/Replay/replay_history_3.tscn",
		"res://scenes/HistoryCutscenes/Replay/replay_historyfinal.tscn",
		"res://scenes/HistoryCutscenes/Replay/replay_history_4.tscn",
		"res://scenes/HistoryCutscenes/Replay/replay_history_5.tscn",
		"res://scenes/HistoryCutscenes/Replay/replay_history_6.tscn",
		"res://scenes/HistoryCutscenes/Replay/replay_ending.tscn",
		
	]
	
	if level < scene_paths.size():
		SceneManager.change_scene(scene_paths[level], {"animation_name_enter": "roll", "pattern_leave": "fade"})

func _on_back_pressed() -> void:
	SceneManager.change_scene('res://scenes/UI/levelselect/selection_menu.tscn', {"animation_name_enter": "roll", "pattern_leave": "fade"})

func _on_timer_timeout() -> void:
	unlock_level.hide()  # Hide the lock message when the timer ends
