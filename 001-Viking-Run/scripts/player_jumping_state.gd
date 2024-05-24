extends State

class_name JumpingState

@export var actor: CharacterBody2D

@export var jump_height : float
@export var jump_time_to_peak : float
@export var jump_time_to_descent : float

@onready var jump_velocity : float = ((2.0 * jump_height) / jump_time_to_peak) * -1.0
@onready var jump_gravity : float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * -1.0
@onready var fall_gravity : float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * -1.0

var velocity := Vector2.ZERO

func enter():
	$"../../PlayerSprite".play("jump1")
	actor.velocity.y = jump_velocity


func physics_update(delta):
	velocity.y += get_gravity() * delta
	actor.move_and_slide()


func get_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity


func jump():
	velocity.y = jump_velocity
	transitioned.emit('Running')
