extends State

class_name SlidingState

@onready var animation: AnimatedSprite2D = $"../../PlayerSprite";
@onready var smoke_effect: AnimatedSprite2D = $"../../Smoke";
@onready var timer = $"../../SlideTimer"
@onready var collider: CollisionShape2D = $"../../CollisionShape2D"

func enter():
	timer.start()
	# Shrink and move the collider to acount for the smaller sprites
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

func _on_slide_timer_timeout():
	# Reset the collider size and position
	collider.shape.extents = Vector2(10.0, 20.0)
	collider.move_local_y(-10.0)
	transitioned.emit("Running")
