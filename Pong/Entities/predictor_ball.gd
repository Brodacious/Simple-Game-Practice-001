extends RigidBody2D

func _ready() -> void:
	Events.predictor_zone_entered.connect(_send_final_location)
# Called when the node enters the scene tree for the first time.
func set_initial_velocity(pos,direction):
	position = pos
	var speed = 800
	linear_velocity = direction * speed


func _on_timer_timeout() -> void:
	queue_free()

func _send_final_location():
	Events.send_prediction_coordinates.emit(global_position.y)
	print("Sent coordinate: " + str(global_position.y))
	
