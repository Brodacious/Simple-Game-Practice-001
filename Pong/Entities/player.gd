extends CharacterBody2D

var max_speed = 3500
var friction = 0.5
var acceleration = 60
var direction = 0

func _physics_process(delta: float) -> void:
	move_and_slide()
	velocity * delta
	if Input.is_action_pressed("up"):
		velocity.y -= acceleration
	elif Input.is_action_pressed("down"):
		velocity.y += acceleration
	else:
		velocity.y = lerp(velocity.y,0.0,friction)
	velocity.y = clamp(velocity.y, -max_speed, max_speed)
