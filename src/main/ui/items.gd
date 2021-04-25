extends ActionButton

onready var confirm : AudioStreamPlayer = $confirm

func _ready():
	connect("pressed", self, "confor")

func _process(_delta):
	if fight.menu_lock == 1:
		alpha_add = -0.5
	elif fight.menu_lock == 2:
		alpha_add = -0.25
	else:
		alpha_add = 0

func confor():
	if fight.turn:
		if fight.menu_lock == 0:
			confirm.pitch_scale = 1.0
			confirm.play()
			fight.menu_lock = 2
		elif fight.menu_lock == 2:
			confirm.pitch_scale = 0.8
			confirm.play()
			fight.menu_lock = 0
