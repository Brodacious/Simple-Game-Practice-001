extends Node

# Signal relay from the ball to the level, which then spawns and configures
# a predictor ball.
signal predictor_ball_spawn(pos,direction)


signal predictor_zone_entered()

# Feeds PredictorBall's final location to the enemy AI
signal send_prediction_coordinates(pos_y)
