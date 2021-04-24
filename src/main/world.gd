extends Spatial

onready var theirhp = $ui/enhp

onready var health = $ui/health
onready var health_under = $ui/health_under
onready var mana = $ui/mana
onready var mana_under = $ui/mana_under

onready var tweener = $ui/tweener

signal block(res)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_enemy_hit(hth):
	theirhp.text = "their hp: " + str(hth)
	emit_signal("block", false)

func _on_tomboy_hit(hth):
	health.value = hth
	tweener.interpolate_property(health_under, "value", health_under.value, health.value, 0.6, Tween.TRANS_SINE)
	tweener.start()

func _on_tomboy_magic(man):
	mana.value = man
	tweener.interpolate_property(mana_under, "value", mana_under.value, mana.value, 0.5, Tween.TRANS_SINE)
	tweener.start()
