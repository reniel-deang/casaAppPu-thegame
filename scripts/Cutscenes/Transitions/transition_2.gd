extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.timeline_ended.connect(to_nextScene)
	Dialogic.start("transition-2")



func to_nextScene():
	SceneManager.change_scene('res://scenes/Cutscenes/platform_1_cutscene.tscn', {"animation_name_enter": "roll", "pattern_leave": "fade"})
