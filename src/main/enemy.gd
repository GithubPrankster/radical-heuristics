extends Node
class_name Enemy

export(int) var health : int = 40 setget damaged
export(int) var max_health : int = 40

export(int) var damage : int = 8

const fight = preload("res://src/main/fight.tres")

onready var kill : AudioStreamPlayer3D = $kill
var ref_material : ShaderMaterial = null

signal faded
var deaths_door : bool = false
var death_fade : float = 1.0

func _ready():
	fight.enemy = self

func _exit_tree():
	fight.enemy = null

func _process(delta):
	if deaths_door:
		if death_fade <= 0.0:
			emit_signal("faded")
			deaths_door = false
			pass
		ref_material.set_shader_param("mixer", Color(death_fade, death_fade, 1, death_fade))
		death_fade -= delta

func damaged(val : int):
	health = clamp(val, 0, max_health)
	fight.enemy_damaged = true
	fight.enemy_last_health = health
	if health == 0:
		kill.play()
		if ref_material != null:
			deaths_door = true
		yield(kill, "finished")
		fight.enemy_desc = String()
		fight.enemy_damaged = true
		queue_free()
	else:
		fight.tomboy.health -= damage
