extends Button
@onready var audio: VBoxContainer = $"../../../../../VBoxContainer3"
@onready var general: VBoxContainer = $"../../../.."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	general.visible = false
	audio.visible = true
