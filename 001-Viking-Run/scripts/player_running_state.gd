extends State

class_name PlayerRunningState

@export var actor: CharacterBody2D

func enter():
	$"../../PlayerSprite".play("run")

func physics_update(_delta):
	if Input.is_action_just_pressed("attack"):
		print('attack???????')
		transitioned.emit("Attacking")
	if Input.is_action_just_pressed("jump"):
		transitioned.emit('Jumping')


