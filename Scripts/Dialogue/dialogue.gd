extends PanelContainer
@onready var speaker: RichTextLabel = $MarginContainer2/VBoxContainer/TextureRect/TextureRect2/TextureRect/speaker
@onready var dialogue_line: RichTextLabel = $MarginContainer2/VBoxContainer/TextureRect/Panel2/dialogueLine
@onready var text_animation: AnimationPlayer = $MarginContainer2/VBoxContainer/TextureRect/Panel2/AnimationPlayer
@onready var character_1: Sprite2D = $MarginContainer2/VBoxContainer/TextureRect/character1
@onready var character_2: Sprite2D = $MarginContainer2/VBoxContainer/TextureRect/character2
@onready var character_3: Sprite2D = $MarginContainer2/VBoxContainer/TextureRect/character3
@onready var character_4: Sprite2D = $MarginContainer2/VBoxContainer/TextureRect/character4
@onready var character_5: Sprite2D = $MarginContainer2/VBoxContainer/TextureRect/character5
@onready var sprite_animation_player: AnimationPlayer = $MarginContainer2/VBoxContainer/TextureRect/character1/AnimationPlayer

@export var actionArray: VNActions
@export var namu: String


const dialogue = preload("res://Story/Dialogue_test/Scenes/sss0.tres")

var index


#option variables
@onready var text_speed =  GeneralOptions.text_speed


var content_dict: Dictionary


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("start")
	actionArray = dialogue
	actionArray.pi()
	print("end")
	GlobalUtil.load_content_dict("res://Story/testStorykappa.json")
	GlobalUtil.set_speaker(speaker)
	GlobalUtil.set_dialog_line(dialogue_line)
	GlobalUtil.set_text_animation(text_animation)
	GlobalUtil.set_sprite1(character_1)
	GlobalUtil.set_sprite2(character_2)
	GlobalUtil.set_sprite3(character_3)
	GlobalUtil.set_sprite4(character_4)
	GlobalUtil.set_sprite5(character_5)
	GlobalUtil.set_sprite_animation(sprite_animation_player)
	GlobalUtil.set_current_page(0)
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
