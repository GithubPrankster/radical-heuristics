extends Node
class_name Enemy

export(int) var health : int = 40 setget damaged
export(int) var max_health : int = 40

export(int) var damage : int = 8

const fight = preload("res://src/main/fight.tres")

onready var kill : AudioStreamPlayer3D = $kill

func _ready():
	fight.enemy = self

func _exit_tree():
	fight.enemy = null

func damaged(val : int):
	health = clamp(val, 0, max_health)
	fight.enemy_damaged = true
	fight.enemy_last_health = health
	if health == 0:
		kill.play()
		fight.enemy_desc = String()
		yield(kill, "finished")
		queue_free()
	else:
		yield(get_tree().create_timer(1.0), "timeout")
		fight.tomboy.health -= damage
