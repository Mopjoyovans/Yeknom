extends Node


signal ability_used_on_enemy(ability)
signal ability_used_on_player(ability)


func emit_ability_used_on_enemy(ability):
	ability_used_on_enemy.emit(ability)


func emit_ability_used_on_player(ability):
	ability_used_on_player.emit(ability)
