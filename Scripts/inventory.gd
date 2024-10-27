extends PanelContainer

@onready var inventory: PanelContainer = $"../../../../../inventory"
@onready var label: Label = $"../../../../../inventory/MarginContainer2/VBoxContainer/ScrollContainer/VBoxContainer/Label"




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	inventory.visible = true
	label.set_text(InventoryInside.display())
