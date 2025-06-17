extends Area2D

@onready var platform_2: Node2D = $"../.."


func _on_body_entered(body: Node2D) -> void:
	platform_2.add_point()
	print("+1 coin")
	queue_free()
