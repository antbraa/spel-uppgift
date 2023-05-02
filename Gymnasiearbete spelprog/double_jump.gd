extends Sprite

#kollar om spelare är i player grupp, om den är det så aktiveras dubbelhopp.
func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		body.jump_max = 2
		queue_free()
		
