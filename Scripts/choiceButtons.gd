extends PanelContainer

signal choice_btn_pressed(choice_index)

@export var choice_index: int = 1

@onready var choice_text: Label = $MarginContainer/Label


func _on_button_pressed() -> void:
	emit_signal("choice_btn_pressed", choice_index)

func set_text(new_text: String) -> void:
	choice_text.text = new_text
