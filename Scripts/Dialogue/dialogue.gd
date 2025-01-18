extends PanelContainer
@onready var speaker: RichTextLabel = $MarginContainer2/VBoxContainer/TextureRect/TextureRect2/TextureRect/speaker
@onready var dialogue_line: RichTextLabel = $MarginContainer2/VBoxContainer/TextureRect/Panel2/dialogueLine
@onready var text_animation: AnimationPlayer = $MarginContainer2/VBoxContainer/TextureRect/Panel2/AnimationPlayer


#option variables
@onready var text_speed =  GeneralOptions.text_speed


var content_dict: Dictionary
var current_page: String


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	content_dict = ContentData.content_dict
	current_page = "000_prologue"
	set_line_content(content_dict[current_page])
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("next_line"):
		print(dialogue_line.visible_ratio)
		if dialogue_line.visible_ratio < 1:
			text_animation.play("text_speed_instant")
		else:
			var output_value = content_dict[current_page]["next"]
			current_page = output_value
			set_dialogue_line(content_dict[output_value])

func set_line_content(output_value) -> void:
	set_speaker(output_value)
	set_dialogue_line(output_value)
	
	
func set_speaker(output_value) -> void:
	speaker.text = str(output_value["speaker"])


func set_dialogue_line(output_value) -> void:
	var storyinstance = str(output_value["dialogue_line"])
	dialogue_line.text = storyinstance
	if text_speed == 0.0:
		text_animation.play("text_speed")
	elif text_speed == 1.0:
		text_animation.play("text_speed_x2")
	elif text_speed == 2.0:
		text_animation.play("text_speed_x3")
	elif text_speed == 3.0:
		text_animation.play("text_speed_instant")
