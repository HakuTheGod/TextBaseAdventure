extends Button
@onready var general: VBoxContainer = $"../../../.."
@onready var bgblurr: Panel = $"../../../../../PanelContainer/Panel"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	general.visible = false
	bgblurr.visible = false
