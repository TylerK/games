extends Node2D

const STARTING_FLOOR_COUNT := 3
var starting_platforms := []

func _ready() -> void:
	var platforms:= get_children()

	# Randomly pick platforms and add them to starting_platforms
	for _i in range(STARTING_FLOOR_COUNT):
		starting_platforms.append(platforms.pick_random())
	# Correctly prints (0,0) for each platform
	for p in starting_platforms:
		print(p.position)

	print('----')

	# Position the platforms
	for i in range(starting_platforms.size()):
		starting_platforms[i].position = Vector2(i * 640, 0)
		# This prints the correct positions
		print(starting_platforms[i].position)

	print('----')

	for i in range(starting_platforms.size()):
		# This prints incorrect positions
		print(starting_platforms[i].position)
##
#func _process(_delta: float) -> void:
	#print('----')
	#for i in range(starting_platforms.size()):
		#print(i, ' ', starting_platforms[i].position)
