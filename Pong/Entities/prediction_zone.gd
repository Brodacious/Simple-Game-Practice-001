extends Area2D

func _on_body_entered(_body: Node2D) -> void:
	Events.predictor_zone_entered.emit()
