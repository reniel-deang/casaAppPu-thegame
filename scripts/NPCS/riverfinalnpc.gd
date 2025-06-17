extends CharacterBody2D

@export var npc_id: String
@export var npc_name: String

@onready var riverfinalnpc: Sprite2D = $"../Indicator/riverfinalnpc"


func start_dialog():
	Dialogic.signal_event.connect(_on_dialogic_signal)
	if !Dialogic.current_timeline:
		Dialogic.start("riverfinalnpc")
	

func _on_dialogic_signal(argument: String):
	if argument == "off_indicator":
		riverfinalnpc.visible = false
	
