class_name UserPrefs extends Resource

@export var text_speed = 0.0
@export var dialog_box_opacity = 1.0
@export var text_animation = "Text_speed_slow"
@export var text_outline_size = 0

const USER_PREFS_PATH: String = "user://user_prefs.tres"

func save() -> void:
	ResourceSaver.save(self, USER_PREFS_PATH)

static func load_or_create() -> UserPrefs:
	var res: UserPrefs
	if FileAccess.file_exists(USER_PREFS_PATH):
		res = load(USER_PREFS_PATH) as UserPrefs
	else:
		res = UserPrefs.new()
	return res
