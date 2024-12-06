extends OptionButton

const RESOLUTION_DICT: Array = [
	Vector2i(1920, 1080), 
	Vector2i(1680, 1050), 
	Vector2i(1600, 900), 
	Vector2i(1440, 900), 
	Vector2i(1366, 768), 
	Vector2i(1360, 768),
	Vector2i(1280, 1024),
	Vector2i(1280, 960),
	Vector2i(1280, 800),
	Vector2i(1280, 768),
	Vector2i(1280, 720),
	Vector2i(1280, 600),
	Vector2i(1152, 864),
	Vector2i(1024, 768),
	Vector2i(800, 600)]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_item_selected(index: int) -> void:
	DisplayServer.window_set_size(RESOLUTION_DICT[index])
