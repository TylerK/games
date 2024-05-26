extends State

class_name PlayerAirAttackingState

@export var actor: CharacterBody2D
@onready var animation: AnimatedSprite2D = $"../../PlayerSprite"

func enter():
	animation.play("air_attack")

func physics_update(delta):
	actor.velocity.y += actor.get_gravity() * delta
	if animation.frame == 3:
		animation.play("jump1")
	if actor.is_on_floor():
		transitioned.emit("Running")

