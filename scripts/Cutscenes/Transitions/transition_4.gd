extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.timeline_ended.connect(to_nextScene)
	Dialogic.start("transition-4")


func to_nextScene():
	SceneManager.change_scene('res://scenes/World/Paralax/Worlds/Platform_2.tscn', {"animation_name_enter": "roll", "pattern_leave": "fade"})
