extends CharacterBody2D
var predictorPosition: int = 0

func _process(delta: float) -> void:
	pass

func _set_ball_prediction(pos):
	predictorPosition = pos
