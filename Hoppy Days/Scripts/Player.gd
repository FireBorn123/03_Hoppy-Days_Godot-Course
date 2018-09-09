extends KinematicBody2D

const SPEED = 750


var motion = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("run")
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("run")
	else:
		motion.x = 0
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("idle")
#$	if Input.is_action_just_pressed("ui_up"):
	move_and_slide(motion)