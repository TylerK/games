extends State

class_name SlidingState

@onready var player_sprite: AnimatedSprite2D = $"../../PlayerSprite";
@onready var timer = $"../../SlideTimer"

func enter():
	timer.start()
	player_sprite.play("slide")

func physics_update(_delta):
	if player_sprite.frame == 3:
		player_sprite.pause()

func _on_slide_timer_timeout():
	transitioned.emit("Running")
