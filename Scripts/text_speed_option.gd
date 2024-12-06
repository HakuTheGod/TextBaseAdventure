extends HSlider
@onready var text_player: AnimationPlayer = $"../Panel/AnimationPlayer"
@onready var general_options: VBoxContainer = $"../../../.."



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_value_changed(value: float) -> void:
	if(value == general_options.text_speed):
		pass
	else:
		if value == 0.0:
			text_player.play("Text_speed_slow")
			general_options.text_animation = "Text_speed_slow"
		elif value == 1.0:
			text_player.play("Text_speed_medium")
			general_options.text_animation = "Text_speed_medium"
		elif value == 2.0:
			text_player.play("Text_speed_fast")
			general_options.text_animation = "Text_speed_fast"
		elif value == 3.0:
			text_player.play("Text_speed_instant")
			general_options.text_animation = "Text_speed_instant"
		general_options.text_speed = value
