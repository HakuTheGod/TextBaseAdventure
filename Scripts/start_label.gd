extends TextureRect


@onready var start_animation: AnimationPlayer = $start_animation
@onready var menu: VBoxContainer = $menu
@onready var start_label: RichTextLabel = $start_label

@onready var general: VBoxContainer = $"../../../../Settings/VBoxContainer"
@onready var display: VBoxContainer = $"../../../../Settings/VBoxContainer2"
@onready var audio: VBoxContainer = $"../../../../Settings/VBoxContainer3"
@onready var controls: VBoxContainer = $"../../../../Settings/VBoxContainer4"
@onready var blur: Panel = $"../../Panel"

@onready var options: Button = $menu/options
@onready var startBtn: Button = $menu/quit2
@onready var continueBtn: Button = $menu/continue
@onready var extras: Button = $menu/extras
@onready var quitBtn: Button = $menu/quit



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_label.visible = true
	menu.visible = false
	start_animation.play("fade_start")
	#start_animation.connect("animation_finished", Callable(self, "_on_start_animation_animation_finished"))


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and GlobVar.on_start_screen == 0:
			start_label.visible = false
			menu.visible = true
			start_animation.play("show_start")
			GlobVar.on_start_screen = 1
	elif event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE and GlobVar.on_start_screen == 1:
			menu.visible = false
			start_label.visible = true
			GlobVar.on_start_screen = 0
			start_animation.play("fade_start")
			for child in menu.get_children():
				child.disabled = true
		elif event.pressed and event.keycode == KEY_ESCAPE and GlobVar.on_start_screen == 2:
			GlobVar.on_start_screen = 1



func _on_start_animation_animation_finished(anim_name: StringName) -> void:
	if anim_name == "show_start":
		for child in menu.get_children():
			child.disabled = false
