extends State

class_name FallingState

@export var actor: CharacterBody2D
@export var coyote_time: float;
@onready var animation: AnimatedSprite2D = $"../../PlayerSprite"

var can_jump = true

func enter():
	can_jump = true
	get_tree().create_timer(coyote_time).timeout.connect(clear_coyote_timer)
	animation.play('fall')

func physics_update(_delta):
	print(can_jump)
	if can_jump:
		if Input.is_action_just_pressed("jump"):
			transitioned.emit("Jumping")
	if actor.is_on_floor():
		transitioned.emit("Running")

func clear_coyote_timer() -> void:
	can_jump = false
