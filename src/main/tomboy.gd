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

onready var moves : AnimationPlayer = $tomboy/AnimationPlayer

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
	moves.play("hurt")
	if health == 0:
		queue_free() # die in the game, die in virtual life

# Return to normal anim, and commence turn if enemy not dead
func returner():
	yield(moves, "animation_finished")
	if fight.enemy != null:
		fight.turn = true
	moves.play("idle_loop")

func engage():
	if fight.turn and fight.enemy != null:
		fight.turn = false
		moves.play("slash")
		yield(get_tree().create_timer(0.5), "timeout")
		fight.enemy.health -= damage
		returner()

func defend():
	if fight.turn and fight.enemy != null:
		fight.turn = false
		defending = true
		moves.play("defend")
		yield(get_tree().create_timer(1.0), "timeout")
		fight.enemy.health = fight.enemy.health
		returner()

func tech():
	if fight.turn and fight.enemy != null:
		fight.turn = false
		mana = clamp(mana - 5, 0, max_mana)
		moves.play("use_item")
		yield(get_tree().create_timer(1.0), "timeout")
		fight.enemy.health -= 20
		emit_signal("magic", mana)
		returner()
