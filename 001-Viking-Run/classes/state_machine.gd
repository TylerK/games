extends Node

class_name StateMachine

@export var current_state: State
var states: Dictionary = {}

func _ready() -> void:
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.transitioned.connect(on_child_transitioned)
		else:
			push_warning("Hey dummy, state machine contains a child which is not 'State'")
	current_state.enter()

func on_child_transitioned(new_state_name: StringName) -> void:
	var new_state = states.get(new_state_name)
	if new_state != null:
		if new_state != current_state:
			current_state.exit()
			new_state.enter()
			current_state = new_state
	else:
		push_warning("Hey dummy, you called a transition on a state that does not exist")

func _process(delta):
	current_state.update(delta)

func _physics_process(delta):
	#print(current_state)
	current_state.physics_update(delta)
