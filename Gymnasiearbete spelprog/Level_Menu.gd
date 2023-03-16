extends Control



func _ready() -> void:
	pass # Replace with function body.

func _on_Level1Button_pressed() -> void:
	get_tree().change_scene("res://Scenes/Level_1.tscn")


func _on_Level2Button_pressed() -> void:
	get_tree().change_scene("res://Scenes/Level_2.tscn")
