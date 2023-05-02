extends Sprite
#kollar så att spelare är i rätt grupp
#när spelaren går på stjärnan så byts scenen till din nuvarande scen+1. Så om du var på nivå 1 och går på stjärnan är du nu på nivå 2 osv
func _on_Hitbox_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		print("res://Scenes/Level_" + str(int(get_tree().current_scene.name) + 1) + ".tscn")
		get_tree().change_scene("res://Scenes/Level_" + str(int(get_tree().current_scene.name) + 1) + ".tscn")

