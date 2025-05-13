extends Button
var save_path = "user://savegame.save"
var hp = 10

func _on_pressed() -> void:
	save()
	pass # Replace with function body.


func save() -> void:
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(hp)
	file.close()
