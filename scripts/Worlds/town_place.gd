extends Node2D

@onready var animation_player: AnimationPlayer = $android_controls/Animated_Text/AnimationPlayer
@onready var show_place: Node2D = $android_controls/Animated_Text/Texts/show_place
@onready var timer: Timer = $android_controls/Animated_Text/Texts/Timer
@onready var photo_timer: Timer = $android_controls/photo_timer
@onready var historical_pic_1: Node2D = $"CanvasLayer/Photos/historical-pic-1"
@onready var historical_pic_2: Node2D = $"CanvasLayer/Photos/historical-pic-2"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	historical_pic_1.hide()
	historical_pic_2.hide()
	show_place.show()
	timer.wait_time = 5.0  # Set timer to 3 seconds (change as needed)
	timer.one_shot = true  
	timer.start()
	Dialogic.signal_event.connect(_on_dialogic_signal)
	$android_controls/Animated_Text/Texts/place_name.show()
	animation_player.play("show_kalinan")

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_dialogic_signal(argument: String):
	if argument == "church_pic":
		photo_timer.start()
		historical_pic_1.show()
	
	if argument == "hcc_pic":
		photo_timer.start()
		historical_pic_2.show()
	
	if argument == "town_complete":
		SceneManager.change_scene('res://scenes/HistoryCutscenes/history_final.tscn', {"animation_name_enter": "roll", "pattern_leave": "fade"})
	
	


func _on_timer_timeout() -> void:
	show_place.hide()
	

func _on_photo_timer_timeout() -> void:
	historical_pic_1.hide()
	historical_pic_2.hide()
