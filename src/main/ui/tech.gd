extends ActionButton

onready var confirm : AudioStreamPlayer = $confirm
onready var magic = $magic
onready var cool = $cool
var toggle : bool = false

func _ready():
	connect("pressed", self, "confirm")

func confirm():
	if fight.turn:
		if !toggle:
			confirm.pitch_scale = 1.0
			confirm.play()
			alpha_add = -0.25
			magic.visible = true
			cool.visible = true
			toggle = true
		else:
			confirm.pitch_scale = 0.8
			confirm.play()
			alpha_add = 0.0
			magic.visible = false
			cool.visible = false
			toggle = false
