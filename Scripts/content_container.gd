extends VBoxContainer

@onready var title: Label = $"../../../../Panel/Title"


@onready var rich_text_label: RichTextLabel = $Panel2/ChapterText

@onready var choices_container: VBoxContainer = $ChoicesContainer
@onready var hud: RichTextLabel = $"../../../../VBoxContainer/Panel2/hud"







var content_dict: Dictionary
var current_page: String

func _ready() -> void:
	content_dict = ContentData.content_dict
	current_page = "000_prologue"
	set_content(content_dict[current_page])

func process_choice(choice_index: int) -> void:
	if content_dict[current_page]["choices"][str(choice_index)]["output"]:
		get_parent().scroll_vertical = 0
		var output_value = content_dict[current_page]["choices"][str(choice_index)]["output"]
		current_page = output_value
		set_content(content_dict[output_value])

func set_content(output_value) -> void:
	clear_choices()
	set_title(output_value)
	set_narr_text(output_value)
	set_choice_btn(output_value)
	set_items(output_value)
	remove_items(output_value)
	setInitialStats()

func clear_choices()-> void:
	for choice in choices_container.get_children():
		choices_container.remove_child(choice)
		choice.queue_free()

func set_title(output_value) -> void:
	title.text = str(output_value["title"])


func set_narr_text(output_value) -> void:
	var storyfile = load("res://Story/Chapters/" + output_value["narr-text"] + ".tscn")
	var storyinstance = storyfile.instantiate()
	rich_text_label.text = storyinstance.text

func set_choice_btn(output_value) -> void:
	var choicePS
	var choiceNode
	if output_value.has("choices"):
		for choice in output_value["choices"]:
			choicePS = load("res://Scenes/choice_button.tscn")
			choiceNode = choicePS.instantiate()
			choices_container.add_child(choiceNode)
			choiceNode.choice_index = choice
			choiceNode.set_text(str(output_value["choices"][str(choice)]["text"]))
			choiceNode.connect("choice_btn_pressed", Callable(self, "process_choice"))
	else:
		#get_tree().quit()	
		pass

func set_items(output_value):
	if output_value.has("items_obtained"):
		for i in output_value["items_obtained"]:
			var item = str(output_value["items_obtained"][str(i)]["text"])
			InventoryInside.add(item)

func remove_items(output_value):
	if output_value.has("items_used"):
		for i in output_value["items_used"]:
			var item = str(output_value["items_used"][str(i)]["text"])
			InventoryInside.remove(item)

func setInitialStats() -> void:
	var stri: int = PC.getStr()
	var spd: int = PC.getSpd()
	var intel: int = PC.getInt()
	var lck: int = PC.getLck()
	var fth: int = PC.getFth()
	var hp: int = PC.getHp()
	var mp: int = PC.getMp()
	
	var hudText = " HP: " + str(hp) + "\n" + " MP: " + str(mp) + "\n" +" Str: " + str(stri) + "\n" + " Spd: " + str(spd) + "\n" + " Int: " + str(intel) + "\n" + " Lck: " + str(lck) + "\n" + " Fth: " + str(fth) 
	hud.text = hudText
	
	
