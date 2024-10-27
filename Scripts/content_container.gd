extends VBoxContainer

@onready var label: Label = %Label
@onready var texture_rect: TextureRect = %TextureRect
@onready var rich_text_label: RichTextLabel = %RichTextLabel
@onready var v_box_container: VBoxContainer = %VBoxContainer
@onready var choice_container_1: PanelContainer = %ChoiceContainer
@onready var choice_container_2: PanelContainer = %ChoiceContainer2
@onready var choice_container_3: PanelContainer = %ChoiceContainer3
@onready var choice_container_4: PanelContainer = %ChoiceContainer4
@onready var choice_container_5: PanelContainer = %ChoiceContainer5
@onready var choice_container_6: PanelContainer = %ChoiceContainer6



var content_dict: Dictionary
var current_page: String

func _ready() -> void:
	content_dict = ContentData.content_dict
	
	current_page = "000_prologue"
	
	set_content(content_dict[current_page])
	
	choice_container_1.connect("choice_btn_pressed", Callable(self, "process_choice"))
	choice_container_2.connect("choice_btn_pressed", Callable(self, "process_choice"))
	choice_container_3.connect("choice_btn_pressed", Callable(self, "process_choice"))
	choice_container_4.connect("choice_btn_pressed", Callable(self, "process_choice"))
	choice_container_5.connect("choice_btn_pressed", Callable(self, "process_choice"))
	choice_container_6.connect("choice_btn_pressed", Callable(self, "process_choice"))

func process_choice(choice_index: int) -> void:
	
	if content_dict[current_page]["choices"][str(choice_index)]["output"]:
		get_parent().scroll_vertical = 0
		var output_value = content_dict[current_page]["choices"][str(choice_index)]["output"]
		current_page = output_value
		print(content_dict[output_value])
		set_content(content_dict[output_value])

func set_content(output_value) -> void:
	
	set_title(output_value)
	set_picture(output_value)
	set_narr_text(output_value)
	set_choice_btn(output_value)
	set_items(output_value)
	remove_items(output_value)

func set_title(output_value) -> void:
	label.text = str(output_value["title"])

func set_picture(output_value) -> void:
	if output_value.has("picture"):
		texture_rect.texture = load(output_value["picture"])
	else:
		texture_rect.texture = null

func set_narr_text(output_value) -> void:
	var f = FileAccess.open(output_value["narr-text"], FileAccess.READ)
	assert(f.file_exists(output_value["narr-text"]), "File Does Not Exist")
	f.open(output_value["narr-text"], f.READ)
	rich_text_label.text = str(f.get_as_text())

func set_choice_btn(output_value) -> void:
	if output_value.has("choices"):
		for choice_container_i in v_box_container.get_children():
			if choice_container_i.visible:
				choice_container_i.set_text("")
				choice_container_i.visible = false
		for choice in output_value["choices"]:
			match choice:
				"1":
					choice_container_1.set_text(str(output_value["choices"][str(choice_container_1.choice_index)]["text"]))
					choice_container_1.visible = true
				"2":
					choice_container_2.set_text(str(output_value["choices"][str(choice_container_2.choice_index)]["text"]))
					choice_container_2.visible = true
				"3":
					choice_container_3.set_text(str(output_value["choices"][str(choice_container_3.choice_index)]["text"]))
					choice_container_3.visible = true
				"4":
					choice_container_4.set_text(str(output_value["choices"][str(choice_container_4.choice_index)]["text"]))
					choice_container_4.visible = true
				"5":
					choice_container_5.set_text(str(output_value["choices"][str(choice_container_5.choice_index)]["text"]))
					choice_container_5.visible = true
				"6":
					choice_container_6.set_text(str(output_value["choices"][str(choice_container_6.choice_index)]["text"]))
					choice_container_6.visible = true
	else:
		get_tree().quit()	

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
			
