extends CharacterBody2D

var max_speed = 35000
var friction = 0.5
var acceleration = 5000
var direction = 0

func _physics_process(delta: float) -> void:
	move_and_slide()
	
	if Input.is_action_pressed("up"):
		velocity.y -= acceleration * delta
	elif Input.is_action_pressed("down"):
		velocity.y += acceleration * delta
	else:
		velocity.y = lerp(velocity.y,0.0,friction)
	velocity.y = clamp(velocity.y, -max_speed, max_speed)
