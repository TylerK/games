extends State

class_name SlidingState

@export var actor: CharacterBody2D
@onready var animation: AnimatedSprite2D = $"../../PlayerSprite";
@onready var smoke_effect: AnimatedSprite2D = $"../../Smoke";
@onready var collider: CollisionShape2D = $"../../CollisionShape2D"

func enter():
	get_tree().create_timer(0.3).timeout.connect(slider_timer_end)
	# Reduce height and move the collider to acount for the slide animation height
	collider.shape.extents = Vector2(10.0, 8.0)
	collider.move_local_y(10.0)
	smoke_effect.visible = true
	smoke_effect.offset.x = 0
	smoke_effect.play("default")
	animation.play("slide")

func physics_update(_delta):
	if animation.frame == 3:
		animation.pause()
	smoke_effect.offset.x -= 1
	if smoke_effect.frame == 3:
		smoke_effect.stop()
		smoke_effect.visible = false

func slider_timer_end():
	# Reset the collider size and position
	collider.shape.extents = Vector2(10.0, 20.0)
	collider.move_local_y(-10.0)
	if InputBuffer.is_action_pressed_buffered('jump'):
		transitioned.emit('Jumping')
	else:
		transitioned.emit("Running")
