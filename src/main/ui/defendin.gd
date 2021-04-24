extends ActionButton

onready var confirm : AudioStreamPlayer = $confirm

func _ready():
	connect("pressed", self, "confirm")

func confirm():
	if fight.turn:
		confirm.play()
		fight.tomboy.defend()
