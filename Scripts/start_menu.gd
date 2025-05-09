extends PanelContainer

@export var on_start_screen = 0
@onready var start_animation: AnimationPlayer = $"MarginContainer2/VBoxContainer/TextureRect/start_animation"
@onready var menu: VBoxContainer = $"MarginContainer2/VBoxContainer/TextureRect/menu"
@onready var start_label: RichTextLabel = $"MarginContainer2/VBoxContainer/TextureRect/start_label"

@onready var v_box_container: VBoxContainer = $"MarginContainer2/VBoxContainer"

@onready var startbtn: Button = $"MarginContainer2/VBoxContainer/TextureRect/menu/start"
@onready var continueBtn: Button = $"MarginContainer2/VBoxContainer/TextureRect/menu/continue"
@onready var options: Button = $"MarginContainer2/VBoxContainer/TextureRect/menu/options"
@onready var extras: Button = $"MarginContainer2/VBoxContainer/TextureRect/menu/extras"
@onready var quitBtn: Button = $"MarginContainer2/VBoxContainer/TextureRect/menu/quit"

# TODO This won't stay for too long.
@onready var options_menu: VBoxContainer = $"../Settings/VBoxContainer"
@onready var text_player: AnimationPlayer = $"../Settings/VBoxContainer/Panel/HBoxContainer/Panel/Panel/AnimationPlayer"
@onready var db: Panel = $"../Settings/VBoxContainer/Panel/HBoxContainer/Panel/Panel"
@onready var text_dis: RichTextLabel = $"../Settings/VBoxContainer/Panel/HBoxContainer/Panel/Panel/RichTextLabel"
@onready var settings: Control = $"../Settings"

var content_dict: Dictionary
var current_page: String

var focusedButton: int = 0

var user_prefs: UserPrefs

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	current_page = "null"
	user_prefs = UserPrefs.load_or_create()
	start_label.visible = true
	menu.visible = false
	start_animation.play("fade_start")
	pass # Replace with function body.
	

# HACK found the children loop hater.
func _process(_delta: float) -> void:
	if not startbtn.has_focus() and focusedButton == 0:
		if Input.is_key_pressed(KEY_UP) or Input.is_key_pressed(KEY_DOWN) and focusedButton == 0:
			startbtn.grab_focus()
			focusedButton = 1
	if startbtn.is_hovered() and not startbtn.has_focus():
		focusedButton = 0
		if continueBtn.has_focus():
			continueBtn.release_focus()
		if options.has_focus():
			options.release_focus()
		if extras.has_focus():
			extras.release_focus()
		if quitBtn.has_focus():
			quitBtn.release_focus()
	elif continueBtn.is_hovered() and not continueBtn.has_focus():
		focusedButton = 0
		if startbtn.has_focus():
			startbtn.release_focus()
		if options.has_focus():
			options.release_focus()
		if extras.has_focus():
			extras.release_focus()
		if quitBtn.has_focus():
			quitBtn.release_focus()
	elif options.is_hovered() and not options.has_focus():
		focusedButton = 0
		if startbtn.has_focus():
			startbtn.release_focus()
		if continueBtn.has_focus():
			continueBtn.release_focus()
		if extras.has_focus():
			extras.release_focus()
		if quitBtn.has_focus():
			quitBtn.release_focus()
	elif extras.is_hovered() and not extras.has_focus():
		focusedButton = 0
		if startbtn.has_focus():
			startbtn.release_focus()
		if continueBtn.has_focus():
			continueBtn.release_focus()
		if options.has_focus():
			options.release_focus()
		if quitBtn.has_focus():
			quitBtn.release_focus()
	elif quitBtn.is_hovered() and not quitBtn.has_focus():
		focusedButton = 0
		if startbtn.has_focus():
			startbtn.release_focus()
		if continueBtn.has_focus():
			continueBtn.release_focus()
		if options.has_focus():
			options.release_focus()
		if extras.has_focus():
			extras.release_focus()
	


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and GlobVar.on_start_screen == 0:
			start_label.visible = false
			menu.visible = true
			start_animation.play("show_start")
			GlobVar.on_start_screen = 1
	elif event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE and GlobVar.on_start_screen == 1:
			menu.visible = false
			start_label.visible = true
			GlobVar.on_start_screen = 0
			start_animation.play("fade_start")
			for child in menu.get_children():
				child.disabled = true
		elif event.pressed and event.keycode == KEY_ESCAPE and GlobVar.on_start_screen == 2:
			GlobVar.on_start_screen = 1



func _on_start_animation_animation_finished(anim_name: StringName) -> void:
	if anim_name == "show_start":
		for child in menu.get_children():
			child.disabled = false


func _on_start_pressed() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	v_box_container.visible = false
	get_tree().change_scene_to_file("res://Scenes/dialog_ui.tscn")
	pass # Replace with function body.


func _on_options_pressed() -> void:
	GlobVar.on_start_screen = 2
	settings.visible = true
	options_menu.visible = true
	text_player.play(user_prefs.text_animation)
	db.self_modulate.a = user_prefs.dialog_box_opacity
	text_dis.add_theme_constant_override("outline_size", user_prefs.text_outline_size)
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
