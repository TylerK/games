extends Node

class_name State

signal transitioned(new_state_name: StringName)

func enter() -> void:
	pass

func exit() -> void:
	pass

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass
