extends Node2D

var platforms = []
const SCREEN_WIDTH = 640
const PLATFORM_SPACING = 640

func _ready() -> void:
	initialize_platforms()

func _physics_process(delta: float) -> void:
	move_platforms(delta)
	recycle_platforms_if_needed()

func initialize_platforms() -> void:
	platforms.clear()
	var tempArray = []
	tempArray.append_array(get_children())
	tempArray.shuffle()

	for i in range(tempArray.size()):
		var platform = tempArray[i]
		platform.position = Vector2(SCREEN_WIDTH * i, 360)
		platforms.append(platform)

func move_platforms(delta: float) -> void:
	for platform in platforms:
		platform.position.x -= Globals.scroll_speed * delta

func recycle_platforms_if_needed() -> void:
	var last_platform = platforms[-1]
	var new_platforms = []

	for platform in platforms:
		if platform.position.x + platform.get_used_rect().size.x < -608:
			new_platforms.append(platform)
			platforms.erase(platform)

	if platforms.size() <= 2:
		randomize_and_append_platforms(last_platform, new_platforms)

func randomize_and_append_platforms(last_platform, new_platforms) -> void:
	new_platforms.shuffle()
	var start_x = last_platform.position.x + PLATFORM_SPACING

	for platform in new_platforms:
		platform.position = Vector2(start_x, 360)
		start_x += PLATFORM_SPACING
		platforms.append(platform)
