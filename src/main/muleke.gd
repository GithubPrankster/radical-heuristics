extends Enemy

onready var mod = $model/Armature/Skeleton/Sphere

func _ready():
	fight.enemy_desc = "Seems smart\nbut is a total kiddo."
	ref_material = mod.get_surface_material(0)
