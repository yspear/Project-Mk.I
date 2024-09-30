extends Node2D
class_name Weapon
enum STATES { READY, FIRING, RELOADING }

@export var BULLET_SCENE: PackedScene

@onready var fire_rate = $gun/fire_rate

var state: STATES = STATES.READY

func change_state(new_state: STATES):
	state = new_state
	
func fire():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)
	

func _on_fire_rate_timeout() -> void:
	fire()
