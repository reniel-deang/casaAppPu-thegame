extends Control
@onready var left: TouchScreenButton = $Android_controls/left
@onready var right: TouchScreenButton = $Android_controls/right
@onready var top: TouchScreenButton = $Android_controls/top
@onready var restart: TouchScreenButton = $Android_controls/restart
@onready var pause: TouchScreenButton = $Android_controls/pause
@onready var bottom: TouchScreenButton = $Android_controls/bottom
@onready var interact: TouchScreenButton = $Android_controls/interact
@onready var next: TouchScreenButton = $Android_controls/next
@onready var accept: TouchScreenButton = $Android_controls/accept
@onready var skip: TouchScreenButton = $Android_controls/skip
@onready var quit: TouchScreenButton = $popupMenu/baseMenuScreenContainer/baseMenuScreen/VBoxContainer/NinePatchRect/MarginContainer/buttonContainer/buttomButtonContainer2/quit
@onready var save: TouchScreenButton = $popupMenu/baseMenuScreenContainer/baseMenuScreen/VBoxContainer/NinePatchRect/MarginContainer/buttonContainer/buttomButtonContainer2/save
@onready var label: Label = $Label
@onready var timer: Timer = $Timer


#instructions
@onready var interact_ins: Label = $Android_controls/Texts/interact_ins
@onready var skip_ins: Label = $Android_controls/Texts/skip_ins
@onready var skip_ins_2: Label = $Android_controls/Texts/skip_ins2
@onready var select_ins: Label = $Android_controls/Texts/select_ins
@onready var move_ins: Label = $Android_controls/Texts/move_ins
@onready var menu_ins: Label = $Android_controls/Texts/menu_ins
@onready var restart_ins: Label = $Android_controls/Texts/restart_ins
@onready var skipvideo_ins: Label = $Android_controls/Texts/skipvideo_ins
@onready var jump_ins: Label = $Android_controls/Texts/jump_ins





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.hide()
	timer.wait_time = 6
	timer.one_shot = true
	timer.start()
	var current_node = get_parent().get_parent()
	
	skip.visible = false
	
	if Dialogic.current_timeline:
		quit.visible = false

	if current_node.is_in_group("Transition"):
		interact.visible = false
		accept.visible = false
		skip.visible = false
		quit.visible = false
		top.visible = false
		bottom.visible = false
		left.visible = false
		right.visible = false
		pause.visible = false
		skip_ins_2.show()
		
	
	elif current_node.is_in_group("Continue"):
		interact.visible = false
		accept.visible = false
		skip.visible = false
		quit.visible = false
		save.visible = false
		top.visible = false
		bottom.visible = false
		left.visible = false
		right.visible = false
		pause.visible = false
		
	
	elif current_node.is_in_group("Sokoban"):
		interact.visible = false
		accept.visible = false
		next.visible = false
		skip.visible = false
		
		if current_node.is_in_group("first"):
			menu_ins.show()
			restart_ins.show()
			move_ins.show()
			
	elif current_node.is_in_group("Cutscene_History"):
		interact.visible = false
		accept.visible = false
		next.visible = false
		top.visible = false
		bottom.visible = false
		left.visible = false
		right.visible = false
		skip.visible = true
		
		skipvideo_ins.show()
		menu_ins.show()
		restart_ins.show()
		
	elif current_node.is_in_group("Platform_Cutscene"):
		top.visible = false
		bottom.visible = false
		left.visible = false
		right.visible = false
		interact.visible = false
		accept.visible = false
		skip.visible = false
		quit.visible = false
		
		menu_ins.show()
		restart_ins.show()
		interact_ins.show()
		
	elif current_node.is_in_group("Platform"):
		top.visible = false
		bottom.visible = false
		accept.visible = false
		next.visible = false
		skip.visible = false
		interact.position = Vector2(1088, 416)
		
		menu_ins.show()
		restart_ins.show()
		jump_ins.show()
		move_ins.show()
		
	elif current_node.is_in_group("Quest"):
		skip.visible = false
		
		
		if current_node.is_in_group("first"):
			interact_ins.show()
			skip_ins.show()
			select_ins.show()
			move_ins.show()
			menu_ins.show()
			restart_ins.show()
		
	elif current_node.is_in_group("Level_Select"):
		top.visible = false
		bottom.visible = false
		accept.visible = false
		next.visible = false
		skip.visible = false
		pause.visible = false
		restart.visible = false
		interact.position = Vector2(1088, 500)

func _on_quit_pressed() -> void:
	SceneManager.change_scene('res://scenes/UI/main_menu.tscn', {"animation_name_enter": "roll", "pattern_leave": "fade"})


func _on_save_pressed() -> void:
	var save_data = {
		"scene": get_tree().current_scene.scene_file_path,
		}
	
	var file = FileAccess.open(Global.SAVE_FILE, FileAccess.WRITE)
	file.store_string(JSON.stringify(save_data, "\t"))  # Store as a readable JSON
	file.close()
	label.show()
	timer.start()
	print("Game Saved!")


func _on_timer_timeout() -> void:
	label.hide()
	interact_ins.hide()
	skip_ins.hide()
	skip_ins_2.hide()
	select_ins.hide()
	move_ins.hide()
	menu_ins.hide()
	restart_ins.hide()
	skipvideo_ins.hide()
	jump_ins.hide()
	
