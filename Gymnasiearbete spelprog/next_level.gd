extends Sprite

func _on_Hitbox_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		print("res://Scenes/Level_" + str(int(get_tree().current_scene.name) + 1) + ".tscn")
		get_tree().change_scene("res://Scenes/Level_" + str(int(get_tree().current_scene.name) + 1) + ".tscn")

