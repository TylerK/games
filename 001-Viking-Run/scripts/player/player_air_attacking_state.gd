extends State

class_name PlayerAirAttackingState

@export var actor: CharacterBody2D
@onready var animation: AnimatedSprite2D = $"../../PlayerSprite"

func enter():
	animation.connect('animation_finished', on_animation_finished)
	animation.play("air_attack")

func physics_update(delta):
	actor.move_and_slide()
	actor.velocity.y += actor.get_gravity() * delta

	if actor.is_on_floor():
		transitioned.emit("Running")

func on_animation_finished():
	animation.play("jump1")
