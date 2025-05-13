extends Button
@onready var dialog_ui: Control = $"../../.."


func _on_pressed() -> void:
	print("BAAACK")
	get_tree().paused = false
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	dialog_ui.visible = false
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
	pass # Replace with function body.
