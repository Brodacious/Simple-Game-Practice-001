extends CharacterBody2D
var predictor_pos_y:float = 400
var direction = Vector2.ZERO
var speed = 30500

func _ready() -> void:
	Events.send_prediction_coordinates.connect(_update_target_position)
	global_position.y = 400
func _process(delta: float) -> void:
	move_and_slide()
	velocity = speed * direction * delta
	if abs(global_position.y - predictor_pos_y) > 25:
		if global_position.y > predictor_pos_y:
			direction = Vector2(0,-1)
		elif global_position.y < predictor_pos_y:
			direction = Vector2(0,1)
	else:
		direction = Vector2(0,0)
#BUG This sometimes returns NIL, crashing
func _update_target_position(pos_y):
	predictor_pos_y = pos_y
	print("Recieved coordinate" + str(pos_y) + str(predictor_pos_y))
