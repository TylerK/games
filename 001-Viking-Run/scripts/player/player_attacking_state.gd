extends State

class_name AttackingState

@export var actor: CharacterBody2D
@onready var animation: AnimatedSprite2D = $"../../PlayerSprite"

func enter():
	animation.play('attack')

func physics_update(_delta):
	if animation.frame == 3:
		transitioned.emit('Running')
