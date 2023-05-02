extends KinematicBody2D

#konstanter för spelarens movement
const UP = Vector2(0, -1)
const GRAVITY = 20
const MAXFALLSPEED = 200
const MAXSPEED = 100
const JUMPFORCE = 350
const ACCEL = 10

#variabel för kameratext
onready var scoreLabel = $Camera2D/Label


var motion = Vector2()
var facing_right = true
var is_dead = false


#variablar för dubbelhopp
var jump_max = 1
var jump_count = 0

var score = 0

var explosion_scene = preload("res://Scenes/Explosion.tscn")

#text på highscore
func _ready() -> void:
	scoreLabel.text = "Score: 0"

func _physics_process(delta: float) -> void:
	
	#kollar så att objektet inte faller för snabbt
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
		
		#Kollar vilket håll gubben kollar. x=1 så kollar gubben åt höger och x = -1 så kollar den åt vänster
	if facing_right == true:
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1
		
	motion.x = clamp(motion.x, -MAXSPEED,MAXSPEED) 
	
	#om knapp D blir nedtryckt och spelare inte är död så spelas "Running" animation och gubben rör sig åt höger
	if Input.is_action_pressed("right"):
		motion.x += ACCEL
		facing_right = true
		if not is_dead:
			$AnimationPlayer.play("Running")
		#om knapp A blir nedtryckt och spelare inte är död så spelas "Running" animation och gubben rör sig åt vänster
	elif Input.is_action_pressed("left"):
		motion.x -= ACCEL
		facing_right = false
		if not is_dead:
			$AnimationPlayer.play("Running")
	#spelaren saktar sakta in för att komma till ett stop. När stop nås så spelas "idle" animationen
	else:
		motion.x = lerp(motion.x,0,0.2)
		if not is_dead:
			$AnimationPlayer.play("Idle")
			
			
	#resetting jump count
	if is_on_floor() and jump_count != 0:
		jump_count = 0
		if jump_count == 2:
			jump_max = 1
	
#när "jump" är tryckt så kollar den om jump max är högre än jump count 
#om kriterierna är mötta så kan man hoppa en gång till.
	if Input.is_action_just_pressed("jump") and jump_count < jump_max:
		motion.y = -JUMPFORCE
		jump_count += 1
				
			
		#om spelar inte är på marken och rör sig i y-led så spelas antingen "jump" eller "fall" animationen.
	if !is_on_floor():
		if motion.y < 0:
			if not is_dead:
				$AnimationPlayer.play("jump")
		elif motion.y > 0:
			if not is_dead:
				$AnimationPlayer.play("fall")
	
	motion = move_and_slide(motion,UP)
	
	#när man dör så spelas en animation och en explosion, sedan skapas en kort timer och en ruta kommer upp där man kan välja att börja om.
func die():
	is_dead = true
	$AnimationPlayer.play("Die")
	_spawn_explosion()
	yield(get_tree().create_timer(0.5), "timeout")
	OS.alert('You died!', 'Game Over')
	yield(get_tree().create_timer(1.0), "timeout")
	get_tree().change_scene("res://Scenes/Menu.tscn")



#spawnar explosioner på samma ställe som spelaren står på
func _spawn_explosion():
	var explosion = explosion_scene.instance()
	explosion.global_position = global_position
	get_tree().get_root().add_child(explosion)
	
	#när man tar en coin så går score upp med 1
func pickup_coin():
	score += 1
	scoreLabel.text = "Score: " + str(score)



