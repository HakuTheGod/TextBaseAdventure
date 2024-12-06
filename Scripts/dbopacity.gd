extends HSlider
@onready var db: Panel = $"../Panel"
@onready var general_options: VBoxContainer = $"../../../.."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_value_changed(value: float) -> void:
	if value == general_options.dbopacity:
		pass
	else:
		db.self_modulate.a = value
		print(value)
		general_options.dbopacity = value
