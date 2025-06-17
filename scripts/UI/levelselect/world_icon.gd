@tool
extends Control


@export var world_index: int = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = "Stage" + str(world_index)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Engine.is_editor_hint():
		$Label.text = "Stage" + str(world_index)
