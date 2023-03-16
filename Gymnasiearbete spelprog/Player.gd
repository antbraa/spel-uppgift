extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const MAXFALLSPEED = 200
const MAXSPEED = 100
const JUMPFORCE = 350
const ACCEL = 10



var motion = Vector2()
var facing_right = true
var is_dead = false

var explosion_scene = preload("res://Scenes/Explosion.tscn")

func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
		
	if facing_right == true:
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1
		
	motion.x = clamp(motion.x, -MAXSPEED,MAXSPEED) 
	
	
	if Input.is_action_pressed("right"):
		motion.x += ACCEL
		facing_right = true
		if not is_dead:
			$AnimationPlayer.play("Running")
	elif Input.is_action_pressed("left"):
		motion.x -= ACCEL
		facing_right = false
		if not is_dead:
			$AnimationPlayer.play("Running")
	else:
		motion.x = lerp(motion.x,0,0.2)
		if not is_dead:
			$AnimationPlayer.play("Idle")
			
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
				motion.y = -JUMPFORCE
			
	if !is_on_floor():
		if motion.y < 0:
			if not is_dead:
				$AnimationPlayer.play("jump")
		elif motion.y > 0:
			if not is_dead:
				$AnimationPlayer.play("fall")
	
	motion = move_and_slide(motion,UP)
	
	
func die():
	print("DEAD")
	is_dead = true
	$AnimationPlayer.play("Die")
	_spawn_explosion()
	#OS.alert('You died', 'Game Over')


func _spawn_explosion():
	var explosion = explosion_scene.instance()
	explosion.global_position = global_position
	get_tree().get_root().add_child(explosion)


