extends CharacterBody2D

@export var npc_id: String
@export var npc_name: String

@onready var rivernpc_dialog_1: Sprite2D = $"../Indicator/rivernpc_dialog1"


func start_dialog():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	if !Dialogic.current_timeline:
		Dialogic.start("rivernpc_dialog1")


func _on_dialogic_signal(argument: String):
	if argument == "off_indicator":
		rivernpc_dialog_1.visible = false
	
