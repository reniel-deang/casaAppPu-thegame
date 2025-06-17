extends Node2D


var scorevalue = 0
@onready var animation_player: AnimationPlayer = $android_controls/Animated_Text/AnimationPlayer
@onready var show_coin: Label = $android_controls/Animated_Text/Texts/show_coin
@onready var no_coin: Label = $android_controls/Animated_Text/Texts/no_coin
@onready var timer: Timer = $android_controls/Animated_Text/Texts/Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = 2.0  # Set timer to 3 seconds (change as needed)
	timer.one_shot = true  # Ensure the timer only runs once per activation
	animation_player.play("show_kalinan")


func add_point():
	scorevalue += 1
	show_coin.text = str(scorevalue) + " BARYA"


func _on_area_2d_body_entered(body: Node2D) -> void:
	if scorevalue != 14:
		no_coin.show()
		timer.start()
		
	elif scorevalue == 14:
		SceneManager.change_scene("res://scenes/HistoryCutscenes/history_6.tscn", {"animation_name_enter": "roll", "pattern_leave": "fade"})
	



func _on_timer_timeout() -> void:
	SceneManager.change_scene(get_tree().current_scene.scene_file_path, {"animation_name_enter": "roll", "pattern_leave": "fade"})
