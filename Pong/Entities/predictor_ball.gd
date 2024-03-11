extends RigidBody2D
var ball_position

func _ready() -> void:
	Events.predictor_zone_entered.connect(_send_final_location)

# Called when the node enters the scene tree for the first time.
func set_initial_velocity(pos,direction):
	position = pos
	var speed = 800
	linear_velocity = direction * speed
	print(direction)

func _process(delta: float) -> void:
	ball_position = global_position.y

func _on_timer_timeout() -> void:
	queue_free()

func _send_final_location():
	Events.send_prediction_coordinates.emit(ball_position)
	
