extends ActionButton

onready var confirm : AudioStreamPlayer = $confirm

func _ready():
	connect("pressed", self, "confirm")

func confirm():
	if fight.turn:
		if fight.menu_lock == 0:
			confirm.pitch_scale = 1.0
			confirm.play()
			alpha_add = -0.25
			fight.menu_lock = 2
		elif fight.menu_lock == 2:
			confirm.pitch_scale = 0.8
			confirm.play()
			alpha_add = 0.0
			fight.menu_lock = 0
