extends Resource
class_name VNActions

var scene_id: String
@export var code: String
@export var actions: Array[Resource]

func _init() -> void:
	print(code)
	print("In scene Resource ", actions.size())
	
	for item in actions.size():
		print("test")
		print(actions[item].text_id)
 
