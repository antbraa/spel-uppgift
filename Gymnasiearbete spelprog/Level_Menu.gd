extends Control



func _ready() -> void:
	pass # Replace with function body.

#Byter till scen 1 
func _on_Level1Button_pressed() -> void:
	get_tree().change_scene("res://Scenes/Level_1.tscn")

#Byter till scen 2
func _on_Level2Button_pressed() -> void:
	get_tree().change_scene("res://Scenes/Level_2.tscn")
