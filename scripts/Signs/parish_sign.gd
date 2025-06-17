extends CharacterBody2D

@export var npc_id: String
@export var npc_name: String

var status: bool

func start_dialog():

	Dialogic.start("parish-sign")
	
