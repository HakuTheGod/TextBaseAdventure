extends Button
var save_path = "user://savegame.save"
var hp = 0

func _on_pressed() -> void:
	load_data()
	print(hp)
	pass # Replace with function body.
	
func load_data() -> void:
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		hp = file.get_var(hp)
		file.close()
	
