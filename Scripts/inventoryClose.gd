extends PanelContainer

@onready var inventory: PanelContainer = $"../../../.."



func _on_button_pressed() -> void:
	inventory.visible = false # Replace with function body.
