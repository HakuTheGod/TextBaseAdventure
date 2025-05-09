extends Control 


var user_prefs: UserPrefs 

@onready var DialogueOpacityBox = $"VBoxContainer/Panel/HBoxContainer/Panel/Panel"
@onready var text_player: AnimationPlayer = $"VBoxContainer/Panel/HBoxContainer/Panel/Panel/AnimationPlayer"
@onready var text_dis: RichTextLabel = $"VBoxContainer/Panel/HBoxContainer/Panel/Panel/RichTextLabel"
@onready var general: VBoxContainer = $"VBoxContainer"
@onready var display: VBoxContainer = $"VBoxContainer2"
@onready var audio: VBoxContainer = $"VBoxContainer3"
@onready var controls: VBoxContainer = $"VBoxContainer4"

@onready var resolutionButton = $"VBoxContainer2/Panel/HBoxContainer/Panel/OptionButton"

const RESOLUTION_DICT: Array = [
	Vector2i(1920, 1080), 
	Vector2i(1680, 1050), 
	Vector2i(1600, 900), 
	Vector2i(1440, 900), 
	Vector2i(1366, 768), 
	Vector2i(1360, 768),
	Vector2i(1280, 1024),
	Vector2i(1280, 960),
	Vector2i(1280, 800),
	Vector2i(1280, 768),
	Vector2i(1280, 720),
	Vector2i(1280, 600),
	Vector2i(1152, 864),
	Vector2i(1024, 768),
	Vector2i(800, 600)]




func _ready() -> void:
	user_prefs = UserPrefs.load_or_create()

func _on_dialog_box_slider_value_changed(value: float) -> void:
	if value == user_prefs.dialog_box_opacity:
		pass
	else:
		DialogueOpacityBox.self_modulate.a = value
		print(value)
		user_prefs.dialog_box_opacity = value
	user_prefs.save()
	pass # Replace with function body.


func _on_text_speed_slider_value_changed(value: float) -> void:
	if(value == user_prefs.text_speed):
		pass
	else:
		if value == 0.0:
			text_player.play("Text_speed_slow")
			user_prefs.text_animation = "Text_speed_slow"
			#Dialogic.Settings.get_setting("text_speed", 100)
		elif value == 1.0:
			text_player.play("Text_speed_medium")
			user_prefs.text_animation = "Text_speed_medium"
			#Dialogic.Settings.get_setting("text_speed", 50)
		elif value == 2.0:
			text_player.play("Text_speed_fast")
			user_prefs.text_animation = "Text_speed_fast"
			#Dialogic.Settings.get_setting("text_speed", 25)
		elif value == 3.0:
			text_player.play("Text_speed_instant")
			user_prefs.text_animation = "Text_speed_instant"
			#Dialogic.Settings.get_setting("text_speed", 0)
		user_prefs.text_speed = value
	user_prefs.save()
	pass # Replace with function body.


# TODO Change from visible/invisible to add/remove child
func _on_close_button_pressed() -> void:
	self.visible = false
	pass # Replace with function body.


func _on_text_outline_button_toggled(toggled_on: bool) -> void:
	release_focus()
	if toggled_on == true:
		text_dis.add_theme_constant_override("outline_size", 6)
		user_prefs.text_outline_size = 6
		
	else:
		text_dis.add_theme_constant_override("outline_size", 0)
		user_prefs.text_outline_size = 0
	pass # Replace with function body.


func _on_display_tab_pressed() -> void:
	general.visible = false
	display.visible = true
	pass # Replace with function body.


func _on_audio_tab_pressed() -> void:
	general.visible = false
	audio.visible = true
	pass # Replace with function body.


func _on_controls_tab_pressed() -> void:
	general.visible = false
	controls.visible = true
	pass # Replace with function body.


func _on_option_button_item_selected(index: int) -> void:
	DisplayServer.window_set_size(RESOLUTION_DICT[index])


func _on_full_screen_button_toggled(_toggled_on: bool) -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	resolutionButton.disabled = true
	pass # Replace with function body.


func _on_win_size_button_toggled(_toggled_on: bool) -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	resolutionButton.disabled = false
	pass # Replace with function body.
