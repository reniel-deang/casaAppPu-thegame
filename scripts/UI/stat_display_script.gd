extends VBoxContainer

@onready var label_display: Label = $labelDisplay
@onready var quest_display: Label = $questDisplay


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	update_text()

func update_text():
	label_display.text = ("GAME")
	quest_display.text = ("MENU")
