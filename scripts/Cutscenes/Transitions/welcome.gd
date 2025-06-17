extends Node2D

@onready var in_game_ui: Control = $android_controls/InGameUI

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.timeline_ended.connect(to_nextScene)
	Dialogic.start("welcome")


func to_nextScene():
	SceneManager.change_scene('res://scenes/World/Level_Composition/spawn_place.tscn', {"animation_name_enter": "roll", "pattern_leave": "fade"})
