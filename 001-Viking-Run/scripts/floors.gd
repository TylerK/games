extends Node2D

var platforms = []

func _ready() -> void:
	reset_platforms()

func _process(delta: float) -> void:
	for platform in platforms:
		platform.position.x -= Globals.scroll_speed * delta
		#print(platform.name, ' ', platform.position.x)
		var platform_width = platform.get_used_rect().size.x * platform.rendering_quadrant_size
		if platform.position.x + platform_width < 0.0:
			platforms.pop_front()

	if platforms.size() <= 1:
		reset_platforms()


func reset_platforms():
	print('resetting ', platforms)
	var count = 0
	var tempArray = []
	tempArray.append_array(get_children())
	tempArray.shuffle()

	for platform in tempArray:
		platform.position = Vector2(640 * count, 360)
		count += 1

	platforms.append_array(tempArray)

	for platform in platforms:
		print(platform.name, ':: ', platform.position)
