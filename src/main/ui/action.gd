extends TextureButton
class_name ActionButton

var init_pos : Vector2 = rect_position
var target_pos = init_pos

export(Color) var COOL_COLOR : Color = Color("#52ed84")
export(Color) var LAME_COLOR : Color = Color("#22c9e5")
var target_color : Color = self_modulate

const fight = preload("res://src/main/fight.tres")

onready var select : AudioStreamPlayer = $select

export var alpha_add : float = 0.0

func _ready():
	randomize()
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exit")

func _on_mouse_entered():
	target_pos = init_pos + Vector2(16, 0)
	target_color = COOL_COLOR
	if fight.turn:
		select.pitch_scale = 1.0 + rand_range(-0.02, 0.02)
		select.play()

func _on_mouse_exit():
	target_pos = init_pos
	target_color = LAME_COLOR

func _process(delta):
	if fight.turn == false:
		target_color.a = 0.5
	else:
		target_color.a = 1.0
	target_color.a += alpha_add
	rect_position = lerp(rect_position, target_pos, delta * 4)
	self_modulate = lerp(self_modulate, target_color, delta * 4)
