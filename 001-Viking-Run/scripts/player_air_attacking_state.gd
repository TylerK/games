extends State

class_name PlayerAirAttackingState

@export var actor: CharacterBody2D
@onready var animation: AnimatedSprite2D = $"../../PlayerSprite"

func enter():
	animation.play("air_attack")

func physics_process(delta):
	actor.move_and_slide()
	actor.velocity.y += get_gravity() * delta
	if actor.is_on_floor():
		transitioned.emit("Jumping")

func get_gravity() -> float:
	return jump_gravity if actor.velocity.y < 0.0 else fall_gravity
