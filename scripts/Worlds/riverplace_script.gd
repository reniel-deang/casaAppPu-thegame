extends Node2D

@onready var animation_player: AnimationPlayer = $android_controls/Animated_Text/AnimationPlayer
@onready var show_place: Node2D = $android_controls/Animated_Text/Texts/show_place
@onready var timer: Timer = $android_controls/Animated_Text/Texts/Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show_place.show()
	timer.wait_time = 5.0  # Set timer to 3 seconds (change as needed)
	timer.one_shot = true  
	timer.start()
	
	Dialogic.signal_event.connect(_on_dialogic_signal)
	#if !Dialogic.current_timeline:
		#Dialogic.start("level1")
	#await Dialogic.timeline_ended
	$android_controls/Animated_Text/Texts/place_name.show()
	animation_player.play("show_kalinan")
  


func _on_place_name_on_body_entered(_body: Node2D) -> void:
	$android_controls/Animated_Text/Texts/place_name.show()
	animation_player.play("show_kalinan")
	
func _on_dialogic_signal(argument: String):
	if argument == "quest_one_ok":
		SceneManager.change_scene('res://scenes/HistoryCutscenes/history_1.tscn', {"animation_name_enter": "roll", "pattern_leave": "fade"})
	


func _on_timer_timeout() -> void:
	show_place.hide()
