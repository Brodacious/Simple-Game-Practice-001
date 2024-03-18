extends CharacterBody2D
var predictor_pos_y:float =  400
var direction:int
var max_speed = 3500
var acceleration = 50
var friction = 0.6

func _ready() -> void:
	Events.send_prediction_coordinates.connect(_update_target_position)
	global_position.y = 400

# I HAVE NO FUCKING IDEA HOW THIS WORKS ANYMORE, IT DEFIES ME. It will do
# ok enough, I don't care to improve it further
func _process(delta: float) -> void:
	move_and_slide()
	velocity * delta
	if direction == 1:
		velocity.y += acceleration
	elif direction == -1:
		velocity.y -= acceleration
	else:
		velocity.y = lerp(velocity.y,0.0,friction)
	
	velocity.y = clamp(velocity.y, -max_speed, max_speed)
	
	if abs(predictor_pos_y - position.y) > 15:
		if predictor_pos_y > position.y: direction = 1
		else: direction = -1
	else: direction = 0
	print("I DON'T WANT TO BE THIS ANIMAL ANYMORE"+str(position.y))
func _update_target_position(pos_y):
	predictor_pos_y = pos_y
	print("fuck"+str(predictor_pos_y))
	print("asshole"+str(global_position.y))
