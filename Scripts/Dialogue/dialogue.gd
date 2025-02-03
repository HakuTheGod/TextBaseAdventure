extends PanelContainer
@onready var speaker: RichTextLabel = $MarginContainer2/VBoxContainer/TextureRect/TextureRect2/TextureRect/speaker
@onready var dialogue_line: RichTextLabel = $MarginContainer2/VBoxContainer/TextureRect/Panel2/dialogueLine
@onready var text_animation: AnimationPlayer = $MarginContainer2/VBoxContainer/TextureRect/Panel2/AnimationPlayer
@onready var sprite_1_pos: Marker2D = $MarginContainer2/VBoxContainer/TextureRect/sprite_1
@onready var sprite_2_pos: Marker2D = $MarginContainer2/VBoxContainer/TextureRect/sprite_2
@onready var sprite_3_pos: Marker2D = $MarginContainer2/VBoxContainer/TextureRect/sprite_3
@onready var sprite_4_pos: Marker2D = $MarginContainer2/VBoxContainer/TextureRect/sprite_4
@onready var sprite_5_pos: Marker2D = $MarginContainer2/VBoxContainer/TextureRect/sprite_5
@onready var sprite_animation_player: AnimationPlayer = $MarginContainer2/VBoxContainer/TextureRect/character1/AnimationPlayer
@onready var characters: Node2D = $MarginContainer2/VBoxContainer/TextureRect/characters
const  characters_scripts_folder = "res://Scripts/Characters/"
@export var actionArray: VNActions
@export var namu: String
const CHARACTER = preload("res://Scenes/character.tscn")
const dialogue = preload("res://Story/Dialogue_test/Scenes/sss0.tres")

var index


#option variables
@onready var text_speed =  GeneralOptions.text_speed


var content_dict: Dictionary

var character_1
var character_2
var character_3
var character_4
var character_5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("start")
	actionArray = dialogue
	actionArray.pi()
	print("end")
	character_1 = CHARACTER.instantiate()
	characters.add_child(character_1)
	var script_path = characters_scripts_folder + "tia.gd"
	var script_1 = load(script_path)
	character_1.set_script(script_1)
	character_1.set_sprite()
	character_1.set_sprite_animation_player()
	change_sprite_expression("character_1", "normal")
	change_sprite_position("character_1", sprite_3_pos)
	GlobalUtil.set_speaker(speaker)
	GlobalUtil.set_dialog_line(dialogue_line)
	GlobalUtil.set_text_animation(text_animation)
	#GlobalUtil.set_sprite_animation(sprite_animation_player)
	GlobalUtil.set_current_page(0)
	character_1.play_animation("fade_in_test")
	await character_1.on_sprite_animation_finished
	GlobalUtil.set_line_content(actionArray.actions[0])
	#GlobalUtil.dl_manager(GlobalUtil.current_page)
	index = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("next_line"):
		if GlobalUtil.get_dl_finished() == true:
			if GlobalUtil.current_page != actionArray.actions.size()-1:
				var next = GlobalUtil.current_page+1
				GlobalUtil.set_current_page(next)
			else:
				get_tree().quit()
		GlobalUtil.vn_input_handler(actionArray.actions[GlobalUtil.current_page])
		#await GlobalUtil.on_line_finished
		#character_1.play_animation("fade_out_test")
		#await character_1.on_sprite_animation_finished

func change_sprite_expression(character_node: String, character_expresion: String) -> void: 
	if character_node == "character_1":
		character_1.change_sprite_expression(character_expresion)
	elif character_node == "character_2":
		character_2.change_sprite_expression(character_expresion)
	elif character_node == "character_3":
		character_3.change_sprite_expression(character_expresion)
	elif character_node == "character_4":
		character_4.change_sprite_expression(character_expresion)
	elif character_node == "character_5":
		character_5.change_sprite_expression(character_expresion)

func change_sprite_position(character_node: String, marker_name: Marker2D) -> void: 
	if character_node == "character_1":
		character_1.set_sprite_position(marker_name.position)
	elif character_node == "character_2":
		character_2.cset_sprite_position(marker_name.position)
	elif character_node == "character_3":
		character_3.set_sprite_position(marker_name.position)
	elif character_node == "character_4":
		character_4.set_sprite_position(marker_name.position)
	elif character_node == "character_5":
		character_5.set_sprite_position(marker_name.position)
