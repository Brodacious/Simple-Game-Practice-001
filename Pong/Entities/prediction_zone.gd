extends Area2D

func _on_body_entered(body: Node2D) -> void:
	Events.predictor_zone_entered.emit()
