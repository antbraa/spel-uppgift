extends Sprite



var score = 0

#kollar om body är i grupp "player", isåfall körs pickup_coin
func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		body.pickup_coin()
		
		queue_free()
		

