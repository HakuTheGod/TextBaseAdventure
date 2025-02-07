extends Node

#signal on_line_finished

#@export var content_dict: Dictionary = {}
#@onready var speaker: RichTextLabel
#@onready var dialogue_line: RichTextLabel
#@onready var text_animation: AnimationPlayer
#@onready var current_sprite1: Sprite2D
#@onready var current_sprite2: Sprite2D
#@onready var current_sprite3: Sprite2D
#@onready var current_sprite4: Sprite2D
#@onready var current_sprite5: Sprite2D
#@onready var sprite_animation_player: AnimationPlayer
#var current_page: int
#var current_animation: String
#var instant_anim: int
#
#var actions: VNActions


#---------------SETTERS---------------

#func set_sprite1(c1: Sprite2D):
	#current_sprite1 = c1

#func set_sprite2(c2: Sprite2D):
	#current_sprite2 = c2
#
#func set_sprite3(c3: Sprite2D):
	#current_sprite3 = c3
#
#func set_sprite4(c4: Sprite2D):
	#current_sprite4 = c4
#
#func set_sprite5(c5: Sprite2D):
	#current_sprite5 = c5

#func set_current_page(p: int):
	#current_page = p

#func set_speaker(sp: RichTextLabel):
	#speaker = sp

#func set_dialog_line(dl: RichTextLabel):
	#dialogue_line = dl

#func set_text_animation(ta: AnimationPlayer):
	#text_animation = ta
	#text_animation.animation_finished.connect(on_text_animation_finished)

#func set_sprite_animation(sa: AnimationPlayer):
	#sprite_animation_player = sa

#func set_current_animation_name(anim: String):
	#current_animation = anim

#func set_line_content(output_value: VNDialogueLine) -> void:
	#display_speaker(output_value.speaker)
	#display_dialogue_line(output_value.text_id)
	##display_sprites(output_value)

#func set_texture_for_sprite(sprite: Sprite2D, texture: String) -> void:
	#if sprite.visible == false:
		#sprite.visible = true
	#if texture == "tia":
		#sprite.texture = sprite.EXPRESSIONS.normal
	#elif texture == "tia_blush":
		#sprite.texture = sprite.EXPRESSIONS.blush

#---------------GETTERS-----------------

#func get_content_dict() -> Dictionary:
	#return content_dict
#
#func get_dl_finished() -> bool:
	#if dialogue_line.visible_ratio < 1:
		#return false
	#else:
		#return true

#---------------Functions---------------

func _ready() -> void:
	#instant_anim = 0
	pass

#func load_content_dict(dialogPath):
	#var f = FileAccess.open(dialogPath, FileAccess.READ)
	#assert(FileAccess.file_exists(dialogPath), "File Does Not Exist")
	#FileAccess.open(dialogPath, f.READ)
	#var json = f.get_as_text()
	#var json_object = JSON.new()
	#json_object.parse(json)
	#content_dict = json_object.data
	
#func sprites_invisible() -> void:
	#if current_sprite1.self_modulate.a == 0:
		#current_sprite1.visible = false
	#if current_sprite2.self_modulate.a == 0:
		#current_sprite2.visible = false
	#if current_sprite3.self_modulate.a == 0:
		#current_sprite3.visible = false
	#if current_sprite4.self_modulate.a == 0:
		#current_sprite4.visible = false
	#if current_sprite5.self_modulate.a == 0:
		#current_sprite5.visible = false
#
#func display_sprites(output_value) -> void:
	#var sprite_animation_type = output_value["sprite_animation_type"]
	#var mass_sprite_animation = output_value["mass_sprite_animation"]
	#var texture1 = output_value["sprite_1"]["file"]
	#var animation_name1 = output_value["sprite_1"]["animation"]
	#var texture2 = output_value["sprite_2"]["file"]
	#var animation_name2 = output_value["sprite_2"]["animation"]
	#var texture3 = output_value["sprite_3"]["file"]
	#var animation_name3 = output_value["sprite_3"]["animation"]
	#var texture4 = output_value["sprite_4"]["file"]
	#var animation_name4 = output_value["sprite_4"]["animation"]
	#var texture5 = output_value["sprite_5"]["file"]
	#var animation_name5 = output_value["sprite_5"]["animation"]
	#
	#if sprite_animation_type == "individual":
		#if texture1 != "none":
			#set_texture_for_sprite(current_sprite1, texture1)
			#if animation_name1 != "none":
				#change_sprite_animation(animation_name1)
		#else:
			#if animation_name1 != "none":
				#change_sprite_animation(animation_name1)
			#
		#if texture2 != "none":
			#set_texture_for_sprite(current_sprite2, texture2)
			#if animation_name2 != "none":
				#change_sprite_animation(animation_name2)
		#else:
			#if animation_name2 != "none":
				#change_sprite_animation(animation_name2)
	#
		#if texture3 != "none":
			#set_texture_for_sprite(current_sprite3, texture3)
			#if animation_name3 != "none":
				#change_sprite_animation(animation_name3)
		#else:
			#if animation_name3 != "none":
				#change_sprite_animation(animation_name3)
			#
		#if texture4 != "none":
			#set_texture_for_sprite(current_sprite4, texture4)
			#if animation_name4 != "none":
				#change_sprite_animation(animation_name4)
		#else:
			#if animation_name4 != "none":
				#change_sprite_animation(animation_name4)
			#
		#if texture5 != "none":
			#set_texture_for_sprite(current_sprite5, texture5)
			#if animation_name5 != "none":
				#change_sprite_animation(animation_name5)
		#else:
			#if animation_name5 != "none":
				#change_sprite_animation(animation_name5)
	#else:
		#if texture1 != "none":
			#set_texture_for_sprite(current_sprite1, texture1)
		#else:
			#current_sprite1.visible = false
		#
		#if texture2 != "none":
			#set_texture_for_sprite(current_sprite2, texture2)
		#else:
			#current_sprite2.visible = false
		#
		#if texture3 != "none":
			#set_texture_for_sprite(current_sprite3, texture3)
		#else:
			#current_sprite3.visible = false
		#
		#if texture4 != "none":
			#set_texture_for_sprite(current_sprite4, texture4)
		#else:
			#current_sprite4.visible = false
		#
		#if texture5 != "none":
			#set_texture_for_sprite(current_sprite5, texture5)
		#else:
			#current_sprite5.visible = false
		#change_sprite_animation(mass_sprite_animation)
		#
		
#func on_text_animation_finished(animation_name):
	#on_line_finished.emit()


#func display_speaker(output_value) -> void:
	#speaker.text = output_value


#func display_dialogue_line(output_value) -> void:
	#var storyinstance = output_value
	#dialogue_line.text = storyinstance
	#if GeneralOptions.text_speed == 0.0:
		#text_animation.play("text_speed")
	#elif GeneralOptions.text_speed == 1.0:
		#text_animation.play("text_speed_x2")
	#elif GeneralOptions.text_speed == 2.0:
		#text_animation.play("text_speed_x3")
	#elif GeneralOptions.text_speed == 3.0:
		#text_animation.play("text_speed_instant")

#func change_text_animation(animation_name) -> void:
	#text_animation.play(animation_name)

#func dl_manager(line_key) -> void:
	#match line_key:
		#"Scene1_0":
			#set_line()
		#"Scene1_1":
			#set_line("Scene1_1")
		#"Scene1_2":
			#set_line("Scene1_2")
		#"Scene1_3":
			#set_line("Scene1_3")

#func vn_input_handler(current_page) -> void:
	#if dialogue_line.visible_ratio < 1:
		#change_text_animation("text_speed_instant")
		##change_sprite_animation(current_animation + "_instant")
	#else:
		##sprites_invisible()
		#set_line_content(current_page)
#
#func change_sprite_animation(animation_name) -> void: 
	#sprite_animation_player.play(animation_name)
	#if instant_anim == 0:
		#set_current_animation_name(animation_name)
