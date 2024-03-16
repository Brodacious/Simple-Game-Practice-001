extends CharacterBody2D

# Movement variables
@export var speed = 100
var direction = Vector2.ZERO
var x_array = [-1,1]
var rand_x_value = x_array.pick_random()
var direction_jitter: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var ball_fire_direction = Vector2(rand_x_value,randf_range(0.8,1.2)).normalized()
	velocity = speed * ball_fire_direction


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		velocity = velocity.bounce(collision.get_normal())*1.01
	direction_jitter = Vector2(0,randf_range(-0.3,0.3))
	direction = velocity.normalized()

func _on_timer_timeout() -> void:
	Events.predictor_ball_spawn.emit(global_position,direction+direction_jitter)
