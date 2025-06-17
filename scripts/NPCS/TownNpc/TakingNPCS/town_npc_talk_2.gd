extends CharacterBody2D

@export var npc_id: String
@export var npc_name: String

@onready var town_npc_2: Sprite2D = $"../../../Indicators/town_npc_2"



func start_dialog():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	if !Dialogic.current_timeline:
		Dialogic.start("town_npc_talk_2")
	

func _on_dialogic_signal(argument: String):
	if argument == "off_indicator":
		town_npc_2.visible = false
	
