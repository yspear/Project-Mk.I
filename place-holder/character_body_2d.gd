extends Area2D


var max_speed := 600.0
var normal_speed := 600
var dash_speed := 1800
var velocity := Vector2(0,0)

func _process(delta: float) -> void:
	var direction := Vector2(0, 0)
	direction.x = Input.get_axis("go_left", "go_right")
	direction.y = Input.get_axis("go_up", "go_down")
	#movemnt code
	if Input.is_action_just_pressed("dash"):
		max_speed = dash_speed
		get_node("Dash_cooldown").start()
	velocity = direction * max_speed
	#Dashing
	position += velocity * delta
	if direction.length() > 0.0:
		direction = direction.normalized()
	#to make the movement smoother
func _physics_process(delta: float) -> void:
	look_at(get_global_mouse_position())
	#make so player is pointing at mouse


func _on_dash_cooldown_timeout() -> void:
	max_speed = normal_speed
