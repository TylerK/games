extends State

class_name JumpingState

@export var actor: CharacterBody2D
@export var jump_buffer_time: float
@onready var animation: AnimatedSprite2D = $"../../PlayerSprite"

var jump_is_buffered = false;

func enter():
	animation.play("jump1")
	jump()

func physics_update(_delta):
	if Input.is_action_just_pressed("attack"):
		transitioned.emit("AirAttacking")
	if Input.is_action_just_released("jump"):
		end_jump()
	if Input.is_action_just_pressed("jump"):
		buffer_jump()
	if actor.is_on_floor():
		if jump_is_buffered:
			jump()
		else:
			transitioned.emit('Running')

func jump() -> void:
	if actor.is_on_floor():
		actor.velocity.y = 0
		actor.velocity.y = actor.jump_velocity

func end_jump() -> void:
	if actor.velocity.y < -100:
		actor.velocity.y = -100

func buffer_jump() -> void:
	if jump_is_buffered:
		pass
	jump_is_buffered = true;
	get_tree().create_timer(jump_buffer_time).connect("timeout", clear_jump_buffer)

func clear_jump_buffer() -> void:
	jump_is_buffered = false
