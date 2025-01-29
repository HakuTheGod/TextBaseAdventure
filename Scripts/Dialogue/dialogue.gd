extends PanelContainer
@onready var speaker: RichTextLabel = $MarginContainer2/VBoxContainer/TextureRect/TextureRect2/TextureRect/speaker
@onready var dialogue_line: RichTextLabel = $MarginContainer2/VBoxContainer/TextureRect/Panel2/dialogueLine
@onready var text_animation: AnimationPlayer = $MarginContainer2/VBoxContainer/TextureRect/Panel2/AnimationPlayer
@export var actions: VNActions
@export var namu: String

var index


#option variables
@onready var text_speed =  GeneralOptions.text_speed


var content_dict: Dictionary


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("start")
	var test_for_dialogue = load("res://Story/Dialogue_test/Scenes/sss0.tres")
	print("end")
	GlobalUtil.load_content_dict("res://Story/testStorykappa.json")
	GlobalUtil.set_speaker(speaker)
	GlobalUtil.set_dialog_line(dialogue_line)
	GlobalUtil.set_text_animation(text_animation)
	GlobalUtil.set_current_page("Scene1_0")
	GlobalUtil.dl_manager(GlobalUtil.current_page)
	index = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("next_line"):
		if(GlobalUtil.get_dl_finished() == true):
			index = index+1
			var output_value = "Scene1_" + str(index)
			GlobalUtil.set_current_page(output_value)
		GlobalUtil.vn_input_handler(GlobalUtil.current_page)
