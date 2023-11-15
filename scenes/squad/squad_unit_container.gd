extends VBoxContainer
class_name SquadUnitContainer


@export var health_container: PackedScene
@export var squad: Squad


func _ready():
	pass
#	squad.add_unit_at_position.connect(on_unit_added)
#	init_unit_display()


func init_unit_display():
#	squad.grid_component.add_unit_at_position.connect(on_unit_added)
#	print(squad.grid_component)
	var grid_size = squad.grid_component.grid_size
	var cell_size = squad.grid_component.cell_size
#	var squad_grid = squad.grid_component.grid
#	var grid_size = 4
#	var cell_size = 32
	
	for row in grid_size:
		var unit_hbox = HBoxContainer.new()
		
		for col in grid_size:
#			var unit_health_component = UnitHealth.new()
#			unit_hbox.add_child(unit_health_component)
			var unit_health_container = health_container.instantiate()
			unit_health_container.init_refs()
			print(squad.grid_component.grid)
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
