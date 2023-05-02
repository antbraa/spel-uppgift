extends Control


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/StartButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass

#byter scen till scen 1 
func _on_StartButton_pressed() -> void:
	get_tree().change_scene("res://Scenes/Level_1.tscn")


#byter scen till "menu" scenen
func _on_LevelButton_pressed() -> void:
	get_tree().change_scene("res://Scenes/Level_Menu.tscn")

#quit
func _on_QuitButton_pressed() -> void:
	get_tree().quit()

