extends CharacterBody2D

@export var npc_id: String
@export var npc_name: String

@onready var rivernpc_1: Sprite2D = $"../Indicator/rivernpc1"

var status: bool

#func _ready() -> void:
	#var target_node = get_node("%MainCharacter")
	#target_node.can_move = false


func start_dialog():
	print("Hello World")
	Dialogic.signal_event.connect(_on_dialogic_signal)
	Dialogic.start("rivernpc1")
	

func _on_dialogic_signal(argument: String):
	if argument == "off_indicator":
		rivernpc_1.visible = false
