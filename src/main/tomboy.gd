extends Node

var health : int = 36
var max_health : int = health

var mana : int = 20
var max_mana : int = mana

var damage : int = 10

var defending : bool = false
var acting : bool = true

signal hit(hth)
signal attack(dmg)
signal magic(mana)
signal cool(cool)

func _ready():
	pass # Replace with function body.

#func _process(delta):
#	pass

func _on_enemy_attack(dmg):
	if defending:
		dmg *= 0.4
		defending = false
	health = clamp(health - dmg, 0, max_health)
	emit_signal("hit", health)
	if health == 0:
		queue_free() # die in the game, die in virtual life
	else:
		acting = true

func _on_attack_pressed():
	if acting:
		emit_signal("attack", damage)

func _on_defend_pressed():
	if acting:
		defending = true
		emit_signal("attack", 0)

func _on_fire_pressed():
	if acting:
		mana = clamp(mana - 5, 0, max_mana)
		emit_signal("attack", 20)
		emit_signal("magic", mana)

func _on_world_block(res):
	acting = res
