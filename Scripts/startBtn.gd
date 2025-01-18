extends Button
@onready var v_box_container: VBoxContainer = $"../../.."

var content_dict: Dictionary
var current_page: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_page = "null"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	v_box_container.visible = false
	get_tree().change_scene_to_file("res://Scenes/dialog_ui.tscn")
	
