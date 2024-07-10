extends State

class_name PlayerAirAttackingState

@export var actor: CharacterBody2D
@onready var animation: AnimatedSprite2D = $"../../PlayerSprite"

func enter():
	print('air attack! hyea!')
	animation.play("air_attack")


func physics_update(_delta):
	#if animation.frame == 3:
		#transitioned.emit("Jumping")
	if actor.is_on_floor_only():
		transitioned.emit("Running")

