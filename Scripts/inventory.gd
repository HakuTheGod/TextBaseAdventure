extends PanelContainer

@onready var inventory: PanelContainer = $"../../inventory"

@onready var label: Label = $"../../inventory/MarginContainer2/VBoxContainer/ScrollContainer/VBoxContainer/Label"



func _on_button_pressed() -> void:
	inventory.visible = true
	label.set_text(InventoryInside.display())
