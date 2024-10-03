extends Area2D


var speed = 1000
var travelled_distance = 0
var direction: Vector2 = Vector2()
func _physics_process(delta: float) -> void:
	const Speed = 1000
	const bullet_range = 800
	position += direction.normalized() * speed * delta
	position += direction * Speed * delta
	travelled_distance += Speed * delta
	if travelled_distance > bullet_range:
		queue_free()
	
	
	


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
