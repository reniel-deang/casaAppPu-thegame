extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.timeline_ended.connect(to_nextScene)
	Dialogic.start("transition-3")



func to_nextScene():
	SceneManager.change_scene('res://scenes/World/Sokoban/sokoban_world_3.tscn', {"animation_name_enter": "roll", "pattern_leave": "fade"})
