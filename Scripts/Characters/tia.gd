extends Node2D

signal on_sprite_animation_finished

const EXPRESSIONS = {
	"normal" = preload("res://Assets/Characters/Tia/tia.png"),
	"blush" = preload("res://Assets/Characters/Tia/tia_blush.png")
}

var sprite_2d: Sprite2D

var animation_player: AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_sprite() -> void:
	sprite_2d = $Sprite2D

func set_sprite_animation_player() -> void:
	animation_player = $AnimationPlayer
	animation_player.animation_finished.connect(_on_character_animation_finished)

func set_sprite_position(pos: Vector2) -> void:
	sprite_2d.position = pos

func change_sprite_expression(expression: String) -> void:
	sprite_2d.texture = EXPRESSIONS[expression]

func play_animation(animation_name: String) -> void:
	animation_player.play(animation_name)

func _on_character_animation_finished(animation_name):
	on_sprite_animation_finished.emit()
