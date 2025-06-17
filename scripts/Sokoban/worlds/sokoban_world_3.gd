extends Node2D

var game_end = false

@onready var animation_player: AnimationPlayer = $Animated_Text/AnimationPlayer

func _ready() -> void:
	animation_player.play("show_kalinan")

func _process(delta: float) -> void:
	if game_end == false:
		var spots = $Spots.get_child_count()
		for i in $Spots.get_children():
			if i.occupied:
				spots -= 1
			
		if spots == 0:
			game_end = true
			SceneManager.change_scene('res://scenes/World/Sokoban/sokoban_world_6.tscn', {"animation_name_enter": "roll", "pattern_leave": "fade"})
	

#func _on_accept_dialog_confirmed() -> void:
	#get_tree().reload_current_scene()
