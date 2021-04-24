extends Node
class_name Enemy

var health : int = 40
var max_health : int = health

var damage : int = 8

# Oh no, a tomboy hit me in the head!
signal hit(hth)
# I DIDNT LIKE IT
signal attack(dmg)

func _on_tomboy_attack(dmg):
	health = clamp(health - dmg, 0, max_health)
	emit_signal("hit", health)
	if health == 0:
		queue_free()
	else:
		yield(get_tree().create_timer(1.0), "timeout")
		emit_signal("attack", damage)
