extends State

class_name PlayerRunningState

@export var actor: CharacterBody2D
@onready var animation: AnimatedSprite2D = $"../../PlayerSprite"

func enter():
	animation.play("run")


func physics_update(_delta):
	if !actor.is_on_floor():
		transitioned.emit('Falling')
	if Input.is_action_just_pressed("jump"):
		transitioned.emit('Jumping')
	if Input.is_action_just_pressed("attack"):
		transitioned.emit('Attacking')
	if Input.is_action_just_pressed("slide"):
		transitioned.emit('Sliding')
