extends Node


signal ability_used(ability)
signal start_unit_turn(unit: Unit)
signal end_unit_turn(unit: Unit)


func emit_ability_used(ability):
	ability_used.emit(ability)


func emit_start_unit_turn(unit: Unit):
	start_unit_turn.emit(unit)


func emit_end_unit_turn(unit: Unit):
	end_unit_turn.emit(unit)
