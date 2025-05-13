extends Button
@onready var pause_menu: Panel = $".."



func _on_pressed() -> void:
	get_tree().paused = false
	pause_menu.visible = false
	pass # Replace with function body.
