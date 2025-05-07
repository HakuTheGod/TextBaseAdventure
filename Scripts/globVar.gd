extends VBoxContainer
@export var on_start_screen = 0

var user_prefs: UserPrefs

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	user_prefs = UserPrefs.load_or_create()
	pass # Replace with function body.
