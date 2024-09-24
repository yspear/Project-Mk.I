extends Area2D


var max_speed := 600.0
var velocity := Vector2(0,0)

func _process(delta: float) -> void:
	var direction := Vector2(0, 0)
	direction.x = Input.get_axis("go_left", "go_right")
	direction.y = Input.get_axis("go_up", "go_down")

	velocity = direction * max_speed
	position += velocity * delta
	if direction.length() > 0.0:
		direction = direction.normalized()
func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
