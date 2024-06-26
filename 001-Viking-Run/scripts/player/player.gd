extends CharacterBody2D

class_name Player

@export var jump_height: float
@export var jump_time_to_peak: float
@export var jump_time_to_descent: float
@export var additional_jump_height: float

@onready var jump_velocity: float = ((2.0 * jump_height) / jump_time_to_peak) * - 1.0
@onready var jump_gravity: float = ((-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)) * - 1.0
@onready var fall_gravity: float = ((-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)) * - 1.0

func get_gravity() -> float:
	return jump_gravity if velocity.y < 0.0 else fall_gravity

func _physics_process(delta: float) -> void:
	velocity.y += get_gravity() * delta
	move_and_slide()
