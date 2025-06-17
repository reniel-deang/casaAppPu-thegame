extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.timeline_ended.connect(platform1_animation)
	Dialogic.start("platform1-cutscene")
	

func platform1_animation():
	animation_player.play("platform1-cutscene")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	SceneManager.change_scene('res://scenes/World/Paralax/Worlds/Platform_1.tscn', {"animation_name_enter": "roll", "pattern_leave": "fade"})
