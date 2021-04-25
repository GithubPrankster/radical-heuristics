extends ActionButton

onready var confirm : AudioStreamPlayer = $confirm
var toggle : bool = false

func _ready():
	connect("pressed", self, "confirm")

func confirm():
	if fight.turn:
		if fight.tech_lock == 0:
			confirm.pitch_scale = 1.0
			confirm.play()
			alpha_add = -0.25
			fight.tech_lock = 1
		elif fight.tech_lock == 1:
			confirm.pitch_scale = 0.8
			confirm.play()
			alpha_add = 0.0
			fight.tech_lock = 0
