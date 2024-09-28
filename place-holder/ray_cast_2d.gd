extends RayCast2D


func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	get_node("Glock")
