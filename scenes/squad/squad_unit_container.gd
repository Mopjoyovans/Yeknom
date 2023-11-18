extends VBoxContainer
class_name SquadUnitContainer


@export var health_container: PackedScene
@export var squad: Squad


func _ready():
	pass
#	squad.add_unit_at_position.connect(on_unit_added)
#	init_unit_display()


func init_unit_display():
	for col in Constants.GRID_SIZE:
		var unit_hbox = HBoxContainer.new()
		
		for row in Constants.GRID_SIZE:
#			var unit_health_component = UnitHealth.new()
#			unit_hbox.add_child(unit_health_component)
			var unit_health_container = health_container.instantiate()
			unit_health_container.init_refs()
			print(squad.grid_component.grid[row][col])
			unit_health_container.set_unit(squad.grid_component.grid[row][col])
			unit_hbox.add_child(unit_health_container)
#			var ability = ability_scene.instantiate() as Ability
#
#			command_button.name = str(ability_data.name, 'Button')
#			command_button.text = ability_data.name
#			command_button.ability = ability.hydrate_ability_data(ability_data.name)
#			commands_container.add_child(command_button)
		add_child(unit_hbox)


func on_unit_added(unit: Unit, x: int, y: int) -> void:
	print("on unit added")
#	if self.get_children().size() == 0:
#		init_unit_display()
