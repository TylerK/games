extends State

class_name AttackingState

@export var actor: CharacterBody2D
@onready var animation: AnimatedSprite2D = $"../../PlayerSprite"

func enter():
	animation.connect("animation_finished", on_animation_finished)
	animation.play('attack')

func on_animation_finished():
	transitioned.emit('Running')
