extends Node2D

@onready var animation_player: AnimationPlayer = $android_controls/Animated_Text/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation_player.play("show_kalinan")


func _on_area_2d_body_entered(body: Node2D) -> void:
	SceneManager.change_scene('res://scenes/HistoryCutscenes/history_3.tscn', {"animation_name_enter": "roll", "pattern_leave": "fade"})
