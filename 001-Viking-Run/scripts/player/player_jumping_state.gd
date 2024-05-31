extends State

class_name JumpingState

@export var actor: CharacterBody2D
@onready var animation: AnimatedSprite2D = $"../../PlayerSprite"
@onready var jump_timer = $"../../MaxJumpTimer"
var is_holding_jump = false

func enter():
	animation.play("jump1")
	jump_timer.start()
	if Input.is_action_pressed("jump"):
		is_holding_jump = true
	if actor.is_on_floor():
		actor.velocity.y = actor.jump_velocity


func physics_update(delta):
	# Handle additional jump height if the player long presses the jump button
	if is_holding_jump:
		if Input.is_action_pressed("jump"):
			actor.velocity.y = actor.jump_velocity * actor.additional_jump_height
	if Input.is_action_just_pressed("attack"):
		transitioned.emit("AirAttacking")
	if actor.is_on_floor():
		transitioned.emit('Running')


func get_gravity() -> float:
	return actor.jump_gravity if actor.velocity.y < 0.0 else actor.fall_gravity


func _on_max_jump_timer_timeout() -> void:
	is_holding_jump = false
