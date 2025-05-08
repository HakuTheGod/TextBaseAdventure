extends PanelContainer

@export var on_start_screen = 0
@onready var start_animation: AnimationPlayer = $"MarginContainer2/VBoxContainer/TextureRect/start_animation"
@onready var menu: VBoxContainer = $"MarginContainer2/VBoxContainer/TextureRect/menu"
@onready var start_label: RichTextLabel = $"MarginContainer2/VBoxContainer/TextureRect/start_label"

var user_prefs: UserPrefs

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	user_prefs = UserPrefs.load_or_create()
	pass # Replace with function body.


func _on_start_animation_animation_finished(anim_name: StringName) -> void:
	pass # Replace with function body.
