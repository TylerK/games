extends Node

const BUFFER_WINDOW = Globals.INPUT_BUFFER_MS

var buffer: Dictionary = {}

func _input(event: InputEvent) -> void:
	var action: StringName = _get_event_action(event)
	if action:
		buffer[action] = Time.get_ticks_msec()


func is_action_just_pressed(action: StringName) -> bool:
	if buffer.has(action):
		return Time.get_ticks_msec() - buffer[action] <= BUFFER_WINDOW
	return false


func _get_event_action(event: InputEvent) -> StringName:
	var actions: Array[StringName] = InputMap.get_actions()
	var event_action: StringName
	actions.reverse()
	for action in actions:
		if !event_action && event.is_action_pressed(action):
			event_action = action
	return event_action
