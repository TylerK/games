extends CharacterBody2D

@export var speed := 500
@export var jump_speed := -800
@export var gravity := 3000
@export_range(0.0, 1.0) var friction := 0.3
@export_range(0.0, 1.0) var acceleration := 0.9

var sprint_velocity_threshold = 190

func handle_horizontal_movement(direction, delta):
	if direction:
		velocity.x = lerp(velocity.x, direction * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0.0, friction )

func get_input(delta):	
	# Move left and right
	var direction = Input.get_axis("move_left", "move_right")
	handle_horizontal_movement(direction, delta)
	
	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed

func update_facing_direction(): 
	var dir = sign(velocity.x)
	if dir == -1:
		$AnimatedSprite2D.flip_h = true
	if dir == 1:
		$AnimatedSprite2D.flip_h = false

func process_gravity(delta):
	velocity.y += gravity * delta

func process_movement_animations():
	if is_on_floor():
		if velocity.x != 0:
			if abs(velocity.x) > 0 && abs(velocity.x) < sprint_velocity_threshold:
				$AnimatedSprite2D.play('walk')
			elif abs(velocity.x) > sprint_velocity_threshold:
				$AnimatedSprite2D.play('run')
		else:
			$AnimatedSprite2D.play('idle')
	else:
		if velocity.y > 0:
			$AnimatedSprite2D.play('jump1')
		elif velocity.y < 0:
			$AnimatedSprite2D.play('jump2')

func _physics_process(delta):
	process_gravity(delta)
	get_input(delta)
	update_facing_direction()
	move_and_slide()
	process_movement_animations()
