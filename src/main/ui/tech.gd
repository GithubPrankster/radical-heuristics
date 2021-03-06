extends ActionButton

onready var confirm : AudioStreamPlayer = $confirm
onready var magic = $magic
onready var cool = $cool

func _ready() -> void:
	connect("pressed", self, "confor")

func _process(_delta) -> void:
	if fight.menu_lock == 2:
		alpha_add = -0.5
	elif fight.menu_lock == 1:
		alpha_add = -0.25
	else:
		alpha_add = 0

func confor() -> void:
	if fight.turn:
		if fight.menu_lock == 0:
			confirm.pitch_scale = 1.0
			confirm.play()
			magic.visible = true
			cool.visible = true
			fight.menu_lock = 1
		elif fight.menu_lock == 1:
			confirm.pitch_scale = 0.8
			confirm.play()
			magic.visible = false
			cool.visible = false
			fight.menu_lock = 0
