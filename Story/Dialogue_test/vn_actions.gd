extends Resource
class_name VNActions

var scene_id: String
@export var code: String
@export var actions: Array[Resource]

const SCENES = {
	scene1 = preload("res://Story/Dialogue_test/Scenes/sss0.csv"),
}

func pi() -> void:
	print(SCENES.scene1.records[0]["key"])
	for i in range(0, actions.size()):
		if actions[i] is VNDialogueLine:
			actions[i].text_id = tr(str(SCENES.scene1.records[i]["key"]))
			actions[i].speaker = SCENES.scene1.records[i]["_speaker"]
	
	for i in range (0, actions.size()):
		print(actions[i].text_id)
		print(actions[i].speaker)
