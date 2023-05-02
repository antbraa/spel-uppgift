extends KinematicBody2D

#skapar en UP konstant som fungerar som röresle i y-led
const UP = Vector2(0, -1)

var motion = Vector2()

#ger lavan en fart uppåt så att den stiger
func _ready() -> void:
	motion.y -= 40
	
	#rör lavan på ett snyggt sätt
func _physics_process(delta: float) -> void:
	motion = move_and_slide(motion,UP)
	
#kollar om spelare är i grupp "player när den blir träffad", om den är det så dör spelaren.
func _on_Area2D_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		body.die()
