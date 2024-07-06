extends CharacterBody2D

class_name Player

@export var jump_height: float # Total jump height
@export var jump_time_to_peak: float # How long it takes to go from the floor to the peak of the jump
@export var jump_time_to_descent: float # How long it takes to go from the peak of the jump to the floor
@onready var jump_velocity: float = ((2.0 * jump_height) / jump_time_to_peak) * - 1.0
@onready var jump_gravity: float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * - 1.0
@onready var fall_gravity: float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * - 1.0

func get_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity

func _physics_process(delta: float) -> void:
	velocity.y += get_gravity() * delta
	move_and_slide()
