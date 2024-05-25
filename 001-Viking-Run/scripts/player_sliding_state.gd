extends State

class_name SlidingState

@onready var animation: AnimatedSprite2D = $"../../PlayerSprite";
@onready var smoke_effect: AnimatedSprite2D = $"../../Smoke";
@onready var timer = $"../../SlideTimer"

func enter():
	timer.start()
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
	transitioned.emit("Running")
