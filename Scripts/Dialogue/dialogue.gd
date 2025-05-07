extends PanelContainer

# === NODES ===
@onready var speaker: RichTextLabel = $MarginContainer2/VBoxContainer/TextureRect/TextureRect2/TextureRect/speaker
@onready var dialogue_line: RichTextLabel = $MarginContainer2/VBoxContainer/TextureRect/Panel2/dialogueLine
@onready var text_animation: AnimationPlayer = $MarginContainer2/VBoxContainer/TextureRect/Panel2/AnimationPlayer

@onready var sprite_1_pos: Marker2D = $MarginContainer2/VBoxContainer/TextureRect/sprite_1
@onready var sprite_2_pos: Marker2D = $MarginContainer2/VBoxContainer/TextureRect/sprite_2
@onready var sprite_3_pos: Marker2D = $MarginContainer2/VBoxContainer/TextureRect/sprite_3
@onready var sprite_4_pos: Marker2D = $MarginContainer2/VBoxContainer/TextureRect/sprite_4
@onready var sprite_5_pos: Marker2D = $MarginContainer2/VBoxContainer/TextureRect/sprite_5

@onready var characters: Node2D = $MarginContainer2/VBoxContainer/TextureRect/characters

# === CONSTANTS ===
const CHARACTER = preload("res://Scenes/vn/character.tscn")
const DIALOGUE = preload("res://Story/Dialogue_test/Scenes/sss0.tres")
const CHAR_SCRIPTS_PATH = "res://Scripts/Characters/"

# === EXPORTED ===
@export var actionArray: VNActions
@export var namu: String

# === STATE ===
var current_page := 0
var input_enabled := true
var is_animating := false
var full_text_shown := false

# === SETTINGS ===
@onready var text_speed = GeneralOptions.text_speed


func _ready() -> void:
	dialogue_line.focus_mode = Control.FOCUS_NONE
	actionArray = DIALOGUE
	actionArray.pi()

	set_line_content(actionArray.actions[0])


func _input(event: InputEvent) -> void:
	if !input_enabled or is_animating:
		return

	if event.is_action_pressed("next_line"):
		if dialogue_line.visible_ratio < 1:
			change_text_animation("text_speed_instant")
			full_text_shown = true
		elif current_page < actionArray.actions.size() - 1:
			current_page += 1
			set_line_content(actionArray.actions[current_page])
		else:
			get_tree().quit()


func set_line_content(output_value) -> void:
	input_enabled = false
	is_animating = true
	full_text_shown = false

	display_speaker(output_value)
	await display_sprites(output_value)
	display_dialogue_line(output_value)

	is_animating = false
	input_enabled = true


func display_speaker(output_value) -> void:
	if output_value is VNDialogueLine:
		speaker.text = output_value.speaker


func display_dialogue_line(output_value) -> void:
	if output_value is VNDialogueLine:
		dialogue_line.text = output_value.text_id
		play_text_animation()


func play_text_animation() -> void:
	match GeneralOptions.text_speed:
		0.0: text_animation.play("text_speed")
		1.0: text_animation.play("text_speed_x2")
		2.0: text_animation.play("text_speed_x3")
		3.0: text_animation.play("text_speed_instant")


func change_text_animation(animation_name: String) -> void:
	text_animation.play(animation_name)


func display_sprites(output_value) -> void:
	if output_value is not VNLineCharacters:
		return

	var character = get_or_create_character(output_value)
	var script_path = CHAR_SCRIPTS_PATH + output_value.character_name + ".gd"
	character.set_script(load(script_path))

	character.set_sprite()
	character.set_sprite_animation_player()
	character.change_sprite_expression(output_value.expression)

	var pos = get_marker_from_pos(output_value.position)
	character.set_sprite_position(pos.position)

	if output_value.animation != "":
		character.play_animation(output_value.animation)
		await character.on_sprite_animation_finished

	if output_value.animation == "fade_out":
		character.queue_free()

	# Optional auto-advance for next VNDialogueLine (remove if not needed)
	if current_page + 1 < actionArray.actions.size():
		var next_line = actionArray.actions[current_page + 1]
		if next_line is VNDialogueLine:
			current_page += 1
			set_line_content(next_line)


func get_or_create_character(data) -> Node:
	for child in characters.get_children():
		if child.character_name == data.character_name:
			return child

	if characters.get_child_count() < 5 and data.animation == "fade_in":
		var new_character = CHARACTER.instantiate()
		characters.add_child(new_character)
		return new_character

	assert(false, "Unknown character: %s" % data.character_name)
	return null


func get_marker_from_pos(pos: int) -> Marker2D:
	match pos:
		1: return sprite_1_pos
		2: return sprite_2_pos
		3: return sprite_3_pos
		4: return sprite_4_pos
		5: return sprite_5_pos
		_: assert(false, "Invalid marker position: %d" % pos); return null
