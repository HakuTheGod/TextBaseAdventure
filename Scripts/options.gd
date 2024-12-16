extends Button
@onready var options_menu: VBoxContainer = $"../../../../../../VBoxContainer"
@onready var bgblurr: Panel = $"../../../../../Panel"
@onready var text_player: AnimationPlayer = $"../../../../../../VBoxContainer/Panel/HBoxContainer/Panel/Panel/AnimationPlayer"
@onready var db: Panel = $"../../../../../../VBoxContainer/Panel/HBoxContainer/Panel/Panel"
@onready var general_options: VBoxContainer = $"../../../../../../VBoxContainer"
@onready var text_dis: RichTextLabel = $"../../../../../../VBoxContainer/Panel/HBoxContainer/Panel/Panel/RichTextLabel"

func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	GlobVar.on_start_screen = 2
	bgblurr.visible = true
	options_menu.visible = true
	text_player.play(general_options.text_animation)
	db.self_modulate.a = general_options.dbopacity
	text_dis.add_theme_constant_override("outline_size", general_options.text_outline_size)
	
func _on_mouse_entered() -> void:
	release_focus()
