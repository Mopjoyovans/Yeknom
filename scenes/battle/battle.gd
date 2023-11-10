extends Node


@export var ability_scene: PackedScene
@export var unit_scene: PackedScene

@onready var player_characters = %PlayerCharacters as Squad
@onready var enemies = %Enemies as Squad
@onready var commands_container = %VBoxContainer


func _ready():
#	print(str('Abilities: ', GameData.abilities))
#	print(str('Units: ', GameData.units['Wolf']))
	GameEvents.ability_used.connect(on_ability_used)
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
#	if player_characters.active_unit == null or player_characters.active_unit.abilities == null:
	var unit: Unit = player_characters.active_unit
	if unit == null:
		return
	var index: int = 0
	
	for ability_name in GameData.abilities:
		var command_button = AbilityButton.new()
		var ability = ability_scene.instantiate() as Ability
		command_button.name = str(ability_name, 'Button')
		command_button.text = ability_name
		command_button.ability = ability.hydrate_ability_data(unit.abilities[index].name)
		commands_container.add_child(command_button)
		index += 1


func process_ability(unit: Unit, ability: Ability):
	unit.take_damage(ability.damage)


func on_ability_used(ability: Ability):
	if enemies.active_unit == null:
		return
	process_ability(enemies.active_unit, ability)
