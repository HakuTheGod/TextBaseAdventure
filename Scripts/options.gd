extends Button
@onready var options_menu: VBoxContainer = $"../../../../../../Settings/VBoxContainer"
@onready var text_player: AnimationPlayer = $"../../../../../../Settings/VBoxContainer/Panel/HBoxContainer/Panel/Panel/AnimationPlayer"
@onready var db: Panel = $"../../../../../../Settings/VBoxContainer/Panel/HBoxContainer/Panel/Panel"
@onready var text_dis: RichTextLabel = $"../../../../../../Settings/VBoxContainer/Panel/HBoxContainer/Panel/Panel/RichTextLabel"
@onready var settings: Control = $"../../../../../../Settings"

var user_prefs: UserPrefs

func _ready() -> void:
	user_prefs = UserPrefs.load_or_create()

func _process(_delta: float) -> void:
	pass


func _on_pressed() -> void:
	GlobVar.on_start_screen = 2
	settings.visible = true
	options_menu.visible = true
	text_player.play(user_prefs.text_animation)
	db.self_modulate.a = user_prefs.dialog_box_opacity
	text_dis.add_theme_constant_override("outline_size", user_prefs.text_outline_size)
	
func _on_mouse_entered() -> void:
	release_focus()
