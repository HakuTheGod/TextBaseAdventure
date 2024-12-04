extends VBoxContainer
@onready var startbtn: Button = $start
@onready var continueBtn: Button = $continue
@onready var options: Button = $options
@onready var extras: Button = $extras
@onready var quitBtn: Button = $quit




var focusedButton: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if not startbtn.has_focus() and focusedButton == 0:
		if Input.is_key_pressed(KEY_UP) or Input.is_key_pressed(KEY_DOWN) and focusedButton == 0:
			startbtn.grab_focus()
			focusedButton = 1
	if startbtn.is_hovered() and not startbtn.has_focus():
		focusedButton = 0
		if continueBtn.has_focus():
			continueBtn.release_focus()
		if options.has_focus():
			options.release_focus()
		if extras.has_focus():
			extras.release_focus()
		if quitBtn.has_focus():
			quitBtn.release_focus()
	elif continueBtn.is_hovered() and not continueBtn.has_focus():
		focusedButton = 0
		if startbtn.has_focus():
			startbtn.release_focus()
		if options.has_focus():
			options.release_focus()
		if extras.has_focus():
			extras.release_focus()
		if quitBtn.has_focus():
			quitBtn.release_focus()
	elif options.is_hovered() and not options.has_focus():
		focusedButton = 0
		if startbtn.has_focus():
			startbtn.release_focus()
		if continueBtn.has_focus():
			continueBtn.release_focus()
		if extras.has_focus():
			extras.release_focus()
		if quitBtn.has_focus():
			quitBtn.release_focus()
	elif extras.is_hovered() and not extras.has_focus():
		focusedButton = 0
		if startbtn.has_focus():
			startbtn.release_focus()
		if continueBtn.has_focus():
			continueBtn.release_focus()
		if options.has_focus():
			options.release_focus()
		if quitBtn.has_focus():
			quitBtn.release_focus()
	elif quitBtn.is_hovered() and not quitBtn.has_focus():
		focusedButton = 0
		if startbtn.has_focus():
			startbtn.release_focus()
		if continueBtn.has_focus():
			continueBtn.release_focus()
		if options.has_focus():
			options.release_focus()
		if extras.has_focus():
			extras.release_focus()
	elif startbtn.is_hovered() and startbtn.has_focus():
		focusedButton = 0
		startbtn.release_focus()
	elif continueBtn.is_hovered() and continueBtn.has_focus():
		focusedButton = 0
		continueBtn.release_focus()
	elif options.is_hovered() and options.has_focus():
		focusedButton = 0
		options.release_focus()
	elif extras.is_hovered() and extras.has_focus():
		focusedButton = 0
		options.release_focus()
	elif quitBtn.is_hovered() and options.has_focus():
		focusedButton = 0
		quitBtn.release_focus()
