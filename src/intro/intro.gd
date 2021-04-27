extends Node2D

onready var button : TextureButton = $tex
onready var fader : ColorRect = $fader
onready var adios : AudioStreamPlayer = $tex/adios
onready var commence : AudioStreamPlayer = $tex/commence
var letsgo : bool = false

func kickoff() -> void:
	letsgo = true
	commence.play()

func tune() -> void:
	adios.play()

func _ready() -> void:
	fader.color.a = 1.0
	button.connect("pressed", self, "kickoff")
	button.connect("mouse_entered", self, "tune")

func _process(delta) -> void:
	if letsgo:
		if fader.color.a == 1.0:
			SceneGuy.scene_switch("res://src/main/world.tscn")
		fader.color.a = clamp(fader.color.a + delta, 0.0, 1.0)
	else: 
		fader.color.a = clamp(fader.color.a - delta, 0.0, 1.0)
