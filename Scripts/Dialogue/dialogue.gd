extends PanelContainer
@onready var speaker: RichTextLabel = $MarginContainer2/VBoxContainer/TextureRect/TextureRect2/TextureRect/speaker
@onready var dialogue_line: RichTextLabel = $MarginContainer2/VBoxContainer/TextureRect/Panel2/dialogueLine
@onready var text_animation: AnimationPlayer = $MarginContainer2/VBoxContainer/TextureRect/Panel2/AnimationPlayer
@onready var sprite_1_pos: Marker2D = $MarginContainer2/VBoxContainer/TextureRect/sprite_1
@onready var sprite_2_pos: Marker2D = $MarginContainer2/VBoxContainer/TextureRect/sprite_2
@onready var sprite_3_pos: Marker2D = $MarginContainer2/VBoxContainer/TextureRect/sprite_3
@onready var sprite_4_pos: Marker2D = $MarginContainer2/VBoxContainer/TextureRect/sprite_4
@onready var sprite_5_pos: Marker2D = $MarginContainer2/VBoxContainer/TextureRect/sprite_5
#@onready var sprite_animation_player: AnimationPlayer = $MarginContainer2/VBoxContainer/TextureRect/character1/AnimationPlayer
@onready var characters: Node2D = $MarginContainer2/VBoxContainer/TextureRect/characters
const  characters_scripts_folder = "res://Scripts/Characters/"
@export var actionArray: VNActions
@export var namu: String
const CHARACTER = preload("res://Scenes/vn/character.tscn")
const dialogue = preload("res://Story/Dialogue_test/Scenes/sss0.tres")
var input_enabled := true
var is_animating := false
var full_text_shown := false

var user_prefs: UserPrefs

var index
var current_page: int


var content_dict: Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	user_prefs = UserPrefs.load_or_create()
	var text_speed =  user_prefs.text_speed
	print("start")
	actionArray = dialogue
	actionArray.pi()
	print("end")
	current_page = 0
	set_line_content(actionArray.actions[0])
	index = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if !input_enabled or is_animating:
		return

	if event.is_action_pressed("next_line"):
		if dialogue_line.visible_ratio < 1:
			change_text_animation("text_speed_instant")
			full_text_shown = true
		else:
			if current_page < actionArray.actions.size() - 1:
				current_page += 1
				set_line_content(actionArray.actions[current_page])
			else:
				get_tree().quit()

func set_line_content(output_value) -> void:
	input_enabled = false
	is_animating = true
	full_text_shown = false
	
	await display_sprites(output_value)

	display_speaker(output_value)
	display_dialogue_line(output_value)

	is_animating = false
	input_enabled = true
	
func display_speaker(output_value) -> void:
	if output_value is not VNDialogueLine:
		return
	speaker.text = output_value.speaker

func display_dialogue_line(output_value) -> void:
	if output_value is not VNDialogueLine:
		return
	var storyinstance = output_value.text_id
	dialogue_line.text = storyinstance
	if user_prefs.text_speed == 0.0:
		text_animation.play("text_speed")
	elif user_prefs.text_speed == 1.0:
		text_animation.play("text_speed_x2")
	elif user_prefs.text_speed == 2.0:
		text_animation.play("text_speed_x3")
	elif user_prefs.text_speed == 3.0:
		text_animation.play("text_speed_instant")
		
func change_text_animation(animation_name) -> void:
	text_animation.play(animation_name)
	

func display_sprites(output_value) ->void:
	var character = null
	if output_value is not VNLineCharacters:
		return
	if characters.get_child_count() < 5 and output_value.animation == "fade_in":
		character = CHARACTER.instantiate()
		characters.add_child(character)
	else:
		for child in characters.get_children():
			if child.character_name == output_value.character_name:
				character = child
		if character == null:
			assert(false, "Error unknown chararacter name")
	var script_path = characters_scripts_folder + output_value.character_name + ".gd"
	var script_1 = load(script_path)
	character.set_script(script_1)
	character.set_sprite()
	character.set_sprite_animation_player()
	character.change_sprite_expression(output_value.expression)
	var pos: Marker2D = get_marker_from_pos(output_value.position)
	character.set_sprite_position(pos.position)
	if output_value.animation != "":
		character.play_animation(output_value.animation)
		await character.on_sprite_animation_finished
	if output_value.animation == "fade_out":
		character.queue_free()
	# -----The following line is in case we implement an auto advance feature----
	#if output_value is VNDialogueLine and output_value.get("auto_advance", false):
		#await get_tree().create_timer(0.5).timeout
		#current_page += 1
		#set_line_content(actionArray.actions[current_page])

func get_marker_from_pos(pos: int) -> Marker2D:
	if pos == 1:
		return sprite_1_pos
	elif pos == 2:
		return sprite_2_pos
	elif pos == 3:
		return sprite_3_pos
	elif pos == 4:
		return sprite_4_pos
	elif pos == 5:
		return sprite_5_pos
	else:
		assert(false, "The value of the marker is not in the range 1 - 5")
		return
