extends TextureRect

export(bool) var traction : bool = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var last_mouse : Vector2 = Vector2(0, 0)

func _input(event):
	if event is InputEventMouseMotion:
		if event.position != last_mouse:
			if last_mouse == Vector2(0, 0):
				last_mouse = event.position
			else:
				var res : float = (last_mouse.x - event.position.x) * 0.1
				if traction:
					rect_position.x += res
				else:
					rect_position.x -= res
				last_mouse = event.position

# Called when the node enters the scene tree for the first time.
func _ready():
	self_modulate.a = 0.0

func _process(delta):
	self_modulate.a = clamp(self_modulate.a + (delta / 2.0), 0.0, 1.0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
