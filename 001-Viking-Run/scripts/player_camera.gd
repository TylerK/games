extends Camera2D

@onready var topLeft = $CameraLimits/TopLeft
@onready var bottomRight = $CameraLimits/BottomRight

# Called when the node enters the scene tree for the first time.
func _ready():
	limit_top = topLeft.position.y
	limit_left = topLeft.position.x
	limit_right = bottomRight.position.x
	limit_bottom = bottomRight.position.y
