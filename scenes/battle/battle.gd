extends Node


@export var unit_scene: PackedScene

@onready var player_characters = %PlayerCharacters
@onready var enemies = %Enemies


func _ready():
#	print(str('Abilities: ', GameData.abilities))
#	print(str('Units: ', GameData.units['Wolf']))
	populate_player_units(["Warrior", "Priest", "Mage"])
	populate_enemy_creatures(["Enforcer", "Enforcer"])
	populate_abilities()
#	populate_abilities(player_team.get_unit_by_name("Warrior"))


func populate_player_units(unit_names: Array[String]) -> void:
	var index: int = 0

	for unit_name_key in unit_names:
		var unit = unit_scene.instantiate() as Unit
		unit.init_child_refs()
		unit.hydrate_unit_data(unit_name_key)
#		unit.health_bar = player_health_bar
#		unit.name_label = player_name_label
#		unit.hp_label = player_hp_label
#		player_characters.add_unit(unit)
		var coords = [50, 50 + 50 * index]
		player_characters.add_unit(unit, coords)
#		player_characters[index].text = unit_name_key
#		player_characters[index].unit = unit
		index += 1


func populate_enemy_creatures(unit_names: Array[String]) -> void:
	var index: int = 0
	
	for unit_name_key in unit_names:
		var unit = unit_scene.instantiate() as Unit
		unit.init_child_refs()
		unit.hydrate_unit_data(unit_name_key)
		
		var coords = [550, 70 + 70 * index]
		enemies.add_unit(unit, coords)
		index += 1


func populate_abilities():
	pass
#	if ability_buttons == null or creature == null or creature.abilities == null:
#		return
#	var index: int = 0
	
#	for button in ability_buttons:
#		var button_node = get_node(button)
#		var ability = ability_scene.instantiate() as Ability
#		if ability != null and creature.abilities.size() > index:
#			button_node.ability = ability.hydrate_ability_data(creature.abilities[index].name)
#			button_node.text = ability.ability_name
#		else:
#			button_node.text = ""
#			button_node.ability = null
#		index += 1
