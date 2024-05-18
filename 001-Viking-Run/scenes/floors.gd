extends Node2D

@export var speed = 200

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var grounds = [
		$Background,
		$Background2,
		$Forground,
		$Forground2
	]
	
	for ground in grounds: 
		ground.position.x -= speed * delta
		if (ground.position.x <= -640):
			ground.position.x = 0

