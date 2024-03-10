extends Node2D

var predictor_ball_preload = preload("res://Entities/predictor_ball.tscn")
@onready var phantom_ball_holder: Node2D = $"Phantom Ball Holder"
@onready var prediction_zone: Area2D = $PredictionZone
@onready var enemy: CharacterBody2D = $enemy
@onready var walls: StaticBody2D = $Walls
@onready var player: CharacterBody2D = $player

func _ready() -> void:
	Events.predictor_ball_spawn.connect(_fire_phantom_ball)


func _fire_phantom_ball(pos,direction):
	var predictor_ball_instance = predictor_ball_preload.instantiate()
	predictor_ball_instance.set_initial_velocity(pos,direction)
	print("PHANTOM")
	phantom_ball_holder.add_child(predictor_ball_instance)
