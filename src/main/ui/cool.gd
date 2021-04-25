extends ActionButton

onready var confirm : AudioStreamPlayer = $confirm
var toggle : bool = false

func _ready():
	connect("pressed", self, "confor")

func _process(_delta):
	if fight.tech_lock == 1:
		alpha_add = -0.5
	elif fight.tech_lock == 2:
		alpha_add = -0.25
	else:
		alpha_add = 0

func confor():
	if fight.turn:
		if fight.tech_lock == 0:
			confirm.pitch_scale = 1.0
			confirm.play()
			fight.tech_lock = 2
		elif fight.tech_lock  == 2:
			confirm.pitch_scale = 0.8
			confirm.play()
			fight.tech_lock  = 0
