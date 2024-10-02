extends Area2D


var speed = 4000
var travelled_distance = 0
func _physics_process(delta: float) -> void:
	const Speed = 4000
	const Range = 6000
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * Speed * delta
	travelled_distance += Speed * delta
	if travelled_distance > Range:
		queue_free()
	
	
	


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage()
