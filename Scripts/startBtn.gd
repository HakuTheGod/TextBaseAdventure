extends Button
@onready var v_box_container: VBoxContainer = $"../../.."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	v_box_container.visible = false
	Dialogic.start("res://Story/Timelines/Demo/Prologue/Porolgue.dtl")
	Dialogic.timeline_ended.connect(ended)
	
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	v_box_container.visible = true
