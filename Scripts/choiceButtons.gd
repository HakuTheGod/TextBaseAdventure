extends PanelContainer

signal choice_btn_pressed(choice_index)

@export var choice_index: int = 1
@onready var choice_text: Label = $TextContainer/Label

func _ready() -> void:
	var button = $Button2
	button.connect("pressed", _on_button_pressed)
	pass # Replace with function body.

func _on_button_pressed() -> void:
	print("Button " + str(choice_index) + " pressed")
	emit_signal("choice_btn_pressed", choice_index)

func set_text(new_text: String) -> void:
	choice_text.text = new_text
