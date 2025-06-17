extends Node2D

@onready var video_stream_player: VideoStreamPlayer = $VideoStreamPlayer

func _ready():
	Global.update_level(3, 3)
	Global.video_stop_requested.connect(_on_video_stream_player_finished)  # Connect signal
	

func _on_video_stream_player_finished() -> void:
	SceneManager.change_scene('res://scenes/Cutscenes/TransitionCutscenes/welcome_2.tscn', {"animation_name_enter": "roll", "pattern_leave": "fade"})
