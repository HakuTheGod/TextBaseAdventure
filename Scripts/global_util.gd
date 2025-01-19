extends Node

@export var content_dict: Dictionary = {}
@onready var speaker: RichTextLabel
@onready var dialogue_line: RichTextLabel
@onready var text_animation: AnimationPlayer
var current_page: String


#---------------SETTERS---------------

func set_current_page(p: String):
	current_page = p

func set_speaker(sp: RichTextLabel):
	speaker = sp

func set_dialog_line(dl: RichTextLabel):
	dialogue_line = dl

func set_text_animation(ta: AnimationPlayer):
	text_animation = ta

func set_line(current_page):
	set_line_content(content_dict[current_page])


func set_line_content(output_value) -> void:
	display_speaker(output_value)
	display_dialogue_line(output_value)

#---------------GETTERS-----------------

func get_content_dict() -> Dictionary:
	return content_dict

func get_dl_finished() -> bool:
	if dialogue_line.visible_ratio < 1:
		return false
	else:
		return true

#---------------Functions---------------

func _ready() -> void:
	pass

func load_content_dict(dialogPath):
	var f = FileAccess.open(dialogPath, FileAccess.READ)
	assert(FileAccess.file_exists(dialogPath), "File Does Not Exist")
	FileAccess.open(dialogPath, f.READ)
	var json = f.get_as_text()
	var json_object = JSON.new()
	json_object.parse(json)
	content_dict = json_object.data



func display_speaker(output_value) -> void:
	speaker.text = str(output_value["speaker"])


func display_dialogue_line(output_value) -> void:
	var storyinstance = str(output_value["dialogue_line"])
	dialogue_line.text = storyinstance
	if GeneralOptions.text_speed == 0.0:
		text_animation.play("text_speed")
	elif GeneralOptions.text_speed == 1.0:
		text_animation.play("text_speed_x2")
	elif GeneralOptions.text_speed == 2.0:
		text_animation.play("text_speed_x3")
	elif GeneralOptions.text_speed == 3.0:
		text_animation.play("text_speed_instant")

func change_text_animation(animation_name) -> void:
	text_animation.play(animation_name)

func dl_manager(line_key) -> void:
	match line_key:
		"Scene1_0":
			set_line("Scene1_0")
		"Scene1_1":
			set_line("Scene1_1")
		"Scene1_2":
			set_line("Scene1_2")
		"Scene1_3":
			set_line("Scene1_3")

func vn_input_handler(current_page) -> void:
	if dialogue_line.visible_ratio < 1:
		change_text_animation("text_speed_instant")
	else:
		dl_manager(current_page)
