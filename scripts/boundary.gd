extends Area2D

func _on_body_entered(body):
	if (body.name == "ball"):
		body.ball_hit_floor_or_ceiling()
