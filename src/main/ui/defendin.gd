extends ActionButton

onready var confirm : AudioStreamPlayer = $confirm

func _ready():
	connect("pressed", self, "confor")

func _process(_delta):
	if fight.menu_lock:
		alpha_add = -0.5
	else:
		alpha_add = 0

func confor():
	if fight.turn and !fight.menu_lock:
		confirm.play()
		fight.tomboy.defend()
