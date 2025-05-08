extends PanelContainer

@export var on_start_screen = 0
@onready var start_animation: AnimationPlayer = $"MarginContainer2/VBoxContainer/TextureRect/start_animation"
@onready var menu: VBoxContainer = $"MarginContainer2/VBoxContainer/TextureRect/menu"
@onready var start_label: RichTextLabel = $"MarginContainer2/VBoxContainer/TextureRect/start_label"

@onready var v_box_container: VBoxContainer = $"MarginContainer2/VBoxContainer"

var user_prefs: UserPrefs

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	user_prefs = UserPrefs.load_or_create()
	start_label.visible = true
	menu.visible = false
	start_animation.play("fade_start")
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	print("Kappa keepo")
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
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	pass # Replace with function body.
