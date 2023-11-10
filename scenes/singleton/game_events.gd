extends Node


signal ability_used(ability)


func emit_ability_used(ability):
	ability_used.emit(ability)
