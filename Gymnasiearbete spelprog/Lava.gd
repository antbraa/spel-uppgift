extends KinematicBody2D

const UP = Vector2(0, -1)

var motion = Vector2()

func _ready() -> void:
	motion.y -= 40
	
func _physics_process(delta: float) -> void:
	motion = move_and_slide(motion,UP)
	

func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		body.die()
