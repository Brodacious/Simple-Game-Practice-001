extends RigidBody2D

func _ready() -> void:
	Events.predictor_zone_entered.connect(_send_final_location)
	
# Called when the node enters the scene tree for the first time.
func set_initial_velocity(pos,direction):
	position = pos
	var speed = 3500
	linear_velocity = direction * speed


func _on_timer_timeout() -> void:
	queue_free()

func _send_final_location():
	#TODO testing if changing global_position.y to position.y does something better
	Events.send_prediction_coordinates.emit(position.y)
	queue_free()
