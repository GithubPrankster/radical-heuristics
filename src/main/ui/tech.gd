extends ActionButton

onready var confirm : AudioStreamPlayer = $confirm
onready var magic = $magic
onready var cool = $cool

func _ready():
	connect("pressed", self, "confirm")

func confirm():
	if fight.turn:
		if fight.menu_lock == 0:
			confirm.pitch_scale = 1.0
			confirm.play()
			alpha_add = -0.25
			magic.visible = true
			cool.visible = true
			fight.menu_lock = 1
		elif fight.menu_lock == 1:
			confirm.pitch_scale = 0.8
			confirm.play()
			alpha_add = 0.0
			magic.visible = false
			cool.visible = false
			fight.menu_lock = 0
