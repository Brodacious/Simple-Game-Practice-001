extends CharacterBody2D

var direction = Vector2.ZERO
var max_speed = 30500
var friction
var acceleration


func _process(delta: float) -> void:
	move_and_slide()
	direction = Input.get_("ui_left","ui_right","ui_up","ui_down")


