extends Node


var character_name: String = "Creature Name"
var attack: int = 50
var defense: int = 50
var endurance: int = 50
var magic: int = 50
var resistance: int = 50
var speed: int = 50


func calculate_damage(incoming_damage: float, is_magical: bool) -> float:
	if is_magical:
		return incoming_damage - resistance
	return incoming_damage - defense
