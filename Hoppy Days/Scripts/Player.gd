extends KinematicBody2D

const SPEED = 750
const GRAVITY = 3000
const UP = Vector2(0, -1)
const JUMP_SPEED = -1200

var motion = Vector2()
export var world_limit = 1980

func _physics_process(delta):
	update_motion(delta)

func _process(delta):
	update_animation(motion)

func update_motion(delta):
	fall(delta)
	run()
	jump()
	move_and_slide(motion, UP)

func update_animation(motion):
	$AnimatedSprite.update(motion)

func fall(delta):
	if is_on_floor() or is_on_ceiling():
		motion.y = 0
	else:
		motion.y += GRAVITY * delta #Essentially because we have delta built into move and slide, we have m/s^2 (Gravity *delta*delta)
	
	if position.y > world_limit:
		end_game()

func run():
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED

	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED

	else:
		motion.x = 0

func jump():
	if is_on_floor() and Input.is_action_pressed("ui_up"):
		motion.y = JUMP_SPEED

func end_game():
	get_tree().change_scene("res://Scenes/GameOver.tscn")
	