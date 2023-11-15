extends Node


@export var ability_scene: PackedScene
@export var unit_scene: PackedScene

@onready var player_characters = %PlayerCharacters as Squad
@onready var enemies = %Enemies as Squad
@onready var commands_container = %CommandVBoxContainer
@onready var player_squad_unit_container = %PlayerSquadUnitContainer as SquadUnitContainer
@onready var enemy_squad_unit_container = %EnemySquadUnitContainer as SquadUnitContainer
@onready var player_sprite_unit_container = %PlayerSpriteUnitContainer as SpriteUnitContainer
@onready var enemy_sprite_unit_container = %EnemySpriteUnitContainer as SpriteUnitContainer


func _ready():
#	print(str('Abilities: ', GameData.abilities))
#	print(str('Units: ', GameData.units['Wolf']))
	GameEvents.ability_used.connect(on_ability_used)
	populate_player_units(["Warrior", "Priest", "Mage"])
	populate_enemy_creatures(["Enforcer", "Enforcer"])
	populate_abilities()
	player_squad_unit_container.init_unit_display()
	enemy_squad_unit_container.init_unit_display()
#	player_sprite_unit_container.init_sprite_grid()
#	enemy_sprite_unit_container.init_sprite_grid()
	player_sprite_unit_container.init_sprite_grid()
	enemy_sprite_unit_container.init_sprite_grid()
#	populate_abilities(player_team.get_unit_by_name("Warrior"))
	print(str("Player squad: ", player_characters.grid_component.squad_to_string()))
	print(str("Enemy squad: ", enemies.grid_component.squad_to_string()))


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
#		var coords = [50, 50 + 50 * index]
		var coords = [0, index]
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
		
#		var coords = [550, 70 + 70 * index]
		var coords = [0, index]
		enemies.add_unit(unit, coords)
		index += 1


func populate_abilities():
	var unit: Unit = player_characters.active_unit
	if unit == null or unit.abilities == null:
		return
	var index: int = 0
	
	for ability_data in unit.abilities:
		var command_button = AbilityButton.new()
		var ability = ability_scene.instantiate() as Ability

		command_button.name = str(ability_data.name, 'Button')
		command_button.text = ability_data.name
		command_button.ability = ability.hydrate_ability_data(ability_data.name)
		commands_container.add_child(command_button)
#		print(unit.abilities[index].name)
#		print("Created ability button ", ability_name, " Damage: ", command_button.ability.damage)
		index += 1


func process_ability(unit: Unit, ability: Ability):
	unit.take_damage(ability.damage)


func on_ability_used(ability: Ability):
	if enemies.active_unit == null:
		return
	process_ability(enemies.active_unit, ability)
