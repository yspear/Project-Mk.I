extends Node2D
class_name Weapon
enum STATES { READY, FIRING, RELOADING }

@export var BULLET_SCENE: PackedScene

@onready var fire_rate = $gun/fire_rate

var state: STATES = STATES.READY

func change_state(new_state: STATES):
	state = new_state
	
func fire():
	if state == STATES.FIRING || state == STATES.RELOADING:
		return
		
	change_state(STATES.FIRING)
	
	var bullet = BULLET_SCENE.instantiate()
	bullet.direction = Vector2.from_angle(global_rotation)
	bullet.global_position = global_position
	
	get_tree().root.add_child(bullet)
	
	change_state(STATES.RELOADING)
	fire_rate.start()


	
	
	
	
	


func _on_fire_rate_timeout() -> void:
	change_state(STATES.READY)
