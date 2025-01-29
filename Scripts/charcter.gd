extends Sprite2D

const CHARACTER_EXPRESSIONS = {
	"tia" = preload("res://Assets/tia.png"),
	"tia_blush" = preload("res://Assets/tia_blush.png")
}

"00a": {
	"sprite": "", 
	"animation": "", 
	"position": "", 
	"animation_trigger_point": ""
}


const tia_scene00b_l1: = "00b": {
	"sprite": "", 
	"animation": "", 
	"position": "", 
	"animation_trigger_point": ""
}


var i = 0

for j in exel.len:
	if exel[j].line > i:
		i++
	actions[i].push(exel[j])
