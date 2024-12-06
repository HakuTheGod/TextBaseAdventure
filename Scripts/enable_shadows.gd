extends Button
@onready var text_dis: RichTextLabel = $"../Panel/RichTextLabel"
@onready var general_options: VBoxContainer = $"../../../.."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_toggled(toggled_on: bool) -> void:
	release_focus()
	if toggled_on == true:
		text_dis.add_theme_constant_override("outline_size", 6)
		general_options.text_outline_size = 6
		
	else:
		text_dis.add_theme_constant_override("outline_size", 0)
		general_options.text_outline_size = 0
