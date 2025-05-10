extends Resource
class_name VNActions

var scene_id: String
@export var code: String
@export var actions: Array[Resource]

var dl_i: int 
var sp_i: int
var bg_i: int
var s_i: int

const SCENES = {
	scene1 = preload("res://Story/Dialogue_test/Scenes/sss0.csv"),
}
const SPRITES = {
	scene1 = preload("res://Story/Dialogue_test/Scenes/sss0_char.csv"),
}

const BACKGROUNDS = {
	scene1 = preload("res://Story/Dialogue_test/Scenes/sss0.csv"),
}

const MUSIC = {
	scene1 = preload("res://Story/Dialogue_test/Scenes/sss0.csv"),
}

func pi() -> void:
	dl_i = 0
	sp_i = 0
	bg_i = 0
	s_i = 0
	print(SPRITES.scene1.records[0]["_expression"])
	for i in range(0, actions.size()):
		if actions[i] is VNDialogueLine:
			actions[i].text_id = tr(str(SCENES.scene1.records[dl_i]["key"]))
			actions[i].speaker = SCENES.scene1.records[dl_i]["_speaker"]
			dl_i = dl_i+1
		elif actions[i] is VNLineCharacters:
			actions[i].expression = SPRITES.scene1.records[sp_i]["_expression"]
			actions[i].character_name = SPRITES.scene1.records[sp_i]["_character_name"]
			actions[i].animation = SPRITES.scene1.records[sp_i]["_animation"]
			actions[i].position = int(SPRITES.scene1.records[sp_i]["_position"])
			sp_i = sp_i+1
		elif actions[i] is VNSceneBackground:
			actions[i].background = BACKGROUNDS.scene1.records[bg_i]["_background"]
			actions[i].animation = BACKGROUNDS.scene1.records[bg_i]["_animation"]
			bg_i = bg_i+1
		elif actions[i] is VNSceneSounds:
			actions[i].bgm = MUSIC.scene1.records[s_i]["_bgm"]
			actions[i].se = MUSIC.scene1.records[s_i]["_se"]
			s_i = s_i+1
