extends ParallaxBackground

@export var scroll_speed := 24

func _process(delta):
	scroll_base_offset.x -= scroll_speed * delta
