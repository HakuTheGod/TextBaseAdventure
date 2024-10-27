extends Node


@export var dialogPath = "res://Story/testStory.json"
var phraseNum : int = 0
var finished : bool = false

var content_dict: Dictionary = {}

func _ready() -> void:
	load_content_dict()
	

func load_content_dict():
	var f = FileAccess.open(dialogPath, FileAccess.READ)
	assert(f.file_exists(dialogPath), "File Does Not Exist")
	f.open(dialogPath, f.READ)
	var json = f.get_as_text()
	var json_object = JSON.new()
	json_object.parse(json)
	content_dict = json_object.data
	print(content_dict)

func get_content_dict() -> Dictionary:
	return content_dict
	
func nextPhrase():
	if phraseNum >= len(content_dict):
		return
	
	finished = false