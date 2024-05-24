extends State

class_name AttackingState

func enter():
	$"../../PlayerSprite".play('attack')

func physics_update(_delta):
	pass

func _on_player_sprite_animation_finished():
	transitioned.emit('Running')
