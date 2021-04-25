extends Camera

var init_pos : Vector3 = translation
var init_rot : float = rotation_degrees.y

func _process(_delta):
	var cur_iter : float = sin(OS.get_ticks_msec() * 0.001)
	translation.x = init_pos.x + (cur_iter * 0.5)
	translation.y = init_pos.y + (cur_iter * 0.125)
	rotation_degrees.y = init_rot + (cur_iter * 2)
