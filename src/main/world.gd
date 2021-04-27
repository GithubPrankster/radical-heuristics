extends Spatial

onready var theirhp = $ui/enhp

onready var health = $ui/health
onready var health_under = $ui/health_under
onready var mana = $ui/mana
onready var mana_under = $ui/mana_under

onready var tweener = $ui/tweener

onready var text = $ui/text

onready var fader = $ui/fader

const fight = preload("res://src/main/fight.tres")

func _ready():
	text.text = fight.enemy_desc
	
	health.value = fight.tomboy.health
	health_under.value = fight.tomboy.health
	
	health.max_value = fight.tomboy.max_health
	health_under.max_value = fight.tomboy.max_health
	
	mana.value = fight.tomboy.mana
	mana_under.value = fight.tomboy.mana
	
	mana.max_value = fight.tomboy.max_mana
	mana_under.max_value = fight.tomboy.max_mana
	
	fader.color.a = 1.0

func _process(delta):
	if fight.enemy_damaged:
		theirhp.text = "their hp: " + str(fight.enemy_last_health)
		text.text = fight.enemy_desc
		fight.enemy_damaged = false
	fader.color.a = clamp(fader.color.a - delta, 0.0, 1.0)

func _on_tomboy_hit(hth):
	health.value = hth
	tweener.interpolate_property(health_under, "value", health_under.value, health.value, 0.8, Tween.TRANS_SINE)
	tweener.start()

func _on_tomboy_magic(man):
	mana.value = man
	tweener.interpolate_property(mana_under, "value", mana_under.value, mana.value, 0.5, Tween.TRANS_SINE)
	tweener.start()
