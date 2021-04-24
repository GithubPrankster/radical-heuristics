extends Spatial

onready var theirhp = $ui/enhp
onready var urhp = $ui/urhp

onready var urmn = $ui/urmn

signal block(res)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_enemy_hit(hth):
	theirhp.text = "their hp: " + str(hth)
	emit_signal("block", false)

func _on_tomboy_hit(hth):
	if hth == 0:
		urhp.queue_free()
		urmn.queue_free()
	else:
		urhp.text = "ur hp: " + str(hth)

func _on_tomboy_magic(mana):
	urmn.text = "ur mn: " + str(mana)
