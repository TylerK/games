extends State

class_name JumpingState

@export var actor: CharacterBody2D
@onready var animation: AnimatedSprite2D = $"../../PlayerSprite"

func enter():
	animation.play("jump1")
	if actor.is_on_floor():
		actor.velocity.y = actor.jump_velocity


func physics_update(delta):
	if Input.is_action_just_pressed("attack"):
		transitioned.emit("AirAttacking")
	if Input.is_action_just_released("jump"):
		end_jump()
	if actor.is_on_floor():
		transitioned.emit('Running')


func get_gravity() -> float:
	return actor.jump_gravity if actor.velocity.y < 0.0 else actor.fall_gravity

func end_jump() -> void:
	if actor.velocity.y < -100:
		actor.velocity.y = -100
