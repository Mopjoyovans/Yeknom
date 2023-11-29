extends Node

enum characters {Mage, Priest, Warrior}

var character_types: Array[String] = [
	"Mage",
	"Priest",
	"Warrior",
]

var TEAM1: Array[String] = [character_types[characters.Warrior], character_types[characters.Priest], character_types[characters.Mage]]
var TEAM2: Array[String] = [character_types[characters.Warrior], character_types[characters.Warrior], character_types[characters.Warrior]]
