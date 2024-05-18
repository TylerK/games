extends CharacterBody2D

@export var jump_speed := -800
@export var gravity := 3000
@export_range(0.0, 1.0) var friction := 0.3
@export_range(0.0, 1.0) var acceleration := 0.9

func get_input():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed

func process_gravity(delta):
	velocity.y += gravity * delta

func process_movement_animations():
	if is_on_floor():
		$AnimatedSprite2D.play('run')
	else:
		if velocity.y > 0:
			$AnimatedSprite2D.play('jump1')
		elif velocity.y < 0:
			$AnimatedSprite2D.play('jump2')

func _physics_process(delta):
	process_gravity(delta)
	get_input()
	move_and_slide()
	process_movement_animations()
