extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func set_initial_velocity(pos,direction):
	position = pos
	var speed = 1500
	linear_velocity = direction * speed
	print(linear_velocity)

func _on_timer_timeout() -> void:
	queue_free()
