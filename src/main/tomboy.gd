extends Node

export(int) var health : int = 36 setget damaged
export(int) var max_health : int = 36

export(int) var mana : int = 20
export(int) var max_mana : int = 20

export(int) var damage : int = 10

var defending : bool = false

signal hit(hth)
signal magic(mana)

const fight = preload("res://src/main/fight.tres")

func _ready():
	fight.tomboy = self

func _exit_tree():
	fight.tomboy = null

func damaged(val : int):
	var dmg : int = health - val
	if defending:
		dmg *= 0.4
		defending = false
	health = clamp(health - dmg, 0, max_health)
	emit_signal("hit", health)
	if health == 0:
		queue_free() # die in the game, die in virtual life
	else:
		fight.turn = true

func engage():
	if fight.turn and fight.enemy != null:
		fight.turn = false
		fight.enemy.health -= damage

func defend():
	if fight.turn and fight.enemy != null:
		fight.turn = false
		defending = true
		fight.enemy.health = fight.enemy.health

func tech():
	if fight.turn and fight.enemy != null:
		fight.turn = false
		mana = clamp(mana - 5, 0, max_mana)
		fight.enemy.health -= 20
		emit_signal("magic", mana)
