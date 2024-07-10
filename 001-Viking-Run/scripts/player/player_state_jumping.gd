extends State

class_name JumpingState

@export var actor: CharacterBody2D
@onready var animation: AnimatedSprite2D = $"../../PlayerSprite"

func enter():
	animation.play("jump1")
	jump()


func physics_update(_delta):
	if Input.is_action_just_pressed("attack"):
		transitioned.emit("Air_Attacking")
	if Input.is_action_just_released("jump"):
		end_jump_early()
	if actor.is_on_floor():
		if InputBuffer.is_action_just_pressed('jump'):
			jump()
		elif InputBuffer.is_action_just_pressed('slide'):
			transitioned.emit('Sliding')
		else:
			transitioned.emit('Running')


func jump() -> void:
	if actor.velocity.y == 0:
		actor.velocity.y = actor.jump_velocity


func end_jump_early() -> void:
	if actor.velocity.y < actor.jump_end_minimum_velocity:
		actor.velocity.y = actor.jump_end_minimum_velocity
