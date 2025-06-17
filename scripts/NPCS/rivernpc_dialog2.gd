extends CharacterBody2D

@export var npc_id: String
@export var npc_name: String

@onready var rivernpc_dialog_2: Sprite2D = $"../Indicator/rivernpc_dialog2"


func start_dialog():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	if !Dialogic.current_timeline:
		Dialogic.start("rivernpc_dialog2")


func _on_dialogic_signal(argument: String):
	if argument == "off_indicator":
		rivernpc_dialog_2.visible = false
	
