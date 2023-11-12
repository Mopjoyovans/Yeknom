extends Node
class_name GridComponent


@export var grid_size: int = 4
@export var cell_size: int = 32

var grid = []


func _ready():
	for x in range(grid_size):
		grid.append([])
		for y in range(grid_size):
			grid[x].append(null)
	
	
func add_unit_at_position(unit: Unit, x: int, y: int) -> void:
	grid[x][y] = unit
	

func get_unit_at_position(unit: Unit, x: int, y: int) -> Unit:
	return grid[x][y]


func get_melee_target(attacker_x: int, attacker_y: int) -> Unit:
	return grid[attacker_x][attacker_y]


func get_ranged_target(attacker_x: int, attacker_y: int) -> Unit:
	return grid[attacker_x][attacker_y]


func squad_to_string() -> String:
	var squad_string: String = ""

	for x in range(grid_size):
		for y in range(grid_size):
			if grid[x][y] != null:
				squad_string = squad_string + str("Unit at ", x, ", ", y, ": ", grid[x][y].stats_component.unit_name, "; ")

	return squad_string
