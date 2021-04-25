extends Resource
class_name Fight

var tomboy = null
var enemy = null

var turn : bool = true

var enemy_damaged : bool = false
var enemy_last_health : int = 0
var enemy_desc: String = String()

var menu_lock : int = 0
var tech_lock : int = 0
