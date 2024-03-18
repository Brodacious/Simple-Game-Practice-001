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
	Events.predictor_ball_spawn.emit(global_position,direction+direction_jitter)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if velocity.x < 500:
		velocity.x * 1000
	
	if collision:
		if velocity.x < 10:
			velocity = velocity.bounce(collision.get_normal())*Vector2(1.08,1)*1.02
			print("boing")
		else:
			velocity = velocity.bounce(collision.get_normal())*1.05
	direction_jitter = Vector2(0,0)
	direction = velocity.normalized()

func _on_timer_timeout() -> void:
	Events.predictor_ball_spawn.emit(global_position,direction+direction_jitter)
