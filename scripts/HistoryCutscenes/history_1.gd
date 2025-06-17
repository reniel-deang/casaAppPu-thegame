extends Node2D
@onready var video_stream_player: VideoStreamPlayer = $VideoStreamPlayer

func _ready():
	Global.update_level(6, 8)
	Global.video_stop_requested.connect(_on_video_stream_player_finished)  # Connect signal
	
func _on_video_stream_player_finished() -> void:
	SceneManager.change_scene('res://scenes/Cutscenes/TransitionCutscenes/transition_1.tscn', {"animation_name_enter": "roll", "pattern_leave": "fade"})
