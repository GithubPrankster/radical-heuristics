extends ColorRect

func _ready() -> void:
	pass

func _process(_delta) -> void:
	material.set_shader_param("time", OS.get_ticks_msec() * 0.001)
