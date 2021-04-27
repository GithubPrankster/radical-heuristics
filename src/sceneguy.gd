extends Node

var cur_scene = null

func _ready() -> void:
	var root = get_tree().get_root()
	cur_scene = root.get_child(root.get_child_count() - 1)

func scene_switch(scene) -> void:
	call_deferred("def_scene_switch", scene)
func def_scene_switch(scene) -> void:
	cur_scene.free()
	
	var sc = ResourceLoader.load(scene)
	
	cur_scene = sc.instance()
	get_tree().get_root().add_child(cur_scene)
	get_tree().set_current_scene(cur_scene)
