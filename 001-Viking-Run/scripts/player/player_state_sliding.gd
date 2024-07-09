extends State

class_name SlidingState

@export var actor: CharacterBody2D
@onready var animation: AnimatedSprite2D = $"../../PlayerSprite";
@onready var smoke_effect: AnimatedSprite2D = $"../../Smoke";
@onready var collider: CollisionShape2D = $"../../CollisionShape2D"


func enter():
	get_tree().create_timer(0.5).timeout.connect(slider_timer_end)
	collider.shape.extents = Vector2(10.0, 10.0)
	collider.move_local_y(10.0)
	animation.play("slide")
	smoke_effect.visible = true
	smoke_effect.offset.x = 0
	smoke_effect.play("default")


func physics_update(_delta):
	if Input.is_action_just_pressed('jump'):
		transitioned.emit('Jumping')
		smoke_effect.visible = false
	if !actor.is_on_floor():
		transitioned.emit("Falling")
	if animation.frame == 3:
		animation.pause()
	smoke_effect.offset.x -= 1
	if smoke_effect.frame == 3:
		smoke_effect.stop()
		smoke_effect.visible = false


func slider_timer_end():
	collider.shape.extents = Vector2(10.0, 20.0)
	collider.move_local_y(-10.0)
	transitioned.emit("Running")
