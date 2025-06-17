extends MarginContainer

@export var menu_screen: VBoxContainer
#@export var open_menu_screen: VBoxContainer


func toggle_visibility(object):
	if object.visible:
		object.visible = false
		get_tree().paused = false
	else:
		object.visible = true


func _on_pause_pressed() -> void:
	toggle_visibility(menu_screen)
	#toggle_visibility(open_menu_screen)
	
	
