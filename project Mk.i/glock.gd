extends Node2D
class_name Weapon
enum STATES { READY, FIRING, RELOADING }

@export var BULLET_SCENE: PackedScene
var target = get_global_mouse_position

@onready var fire_rate = $gun/fire_rate

var state: STATES = STATES.READY

func change_state(new_state: STATES):
	state = new_state
	
func fire():
	if state == STATES.FIRING || state == STATES.RELOADING:
		return
		
	change_state(STATES.FIRING)
	
	var bullet = BULLET_SCENE.instantiate()
	var direction_to_mouse = bullet.global_position.direction_to(target).normalized()

	get_tree().root.add_child(bullet)
	
	change_state(STATES.RELOADING)
	fire_rate.start()
