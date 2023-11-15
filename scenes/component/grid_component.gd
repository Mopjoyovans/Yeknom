extends Node
class_name GridComponent


var grid = []


func _ready():
	for x in range(Constants.GRID_SIZE):
		grid.append([])
		for y in range(Constants.GRID_SIZE):
			grid[x].append(null)
	
	
func add_unit_at_position(unit: Unit, x: int, y: int) -> void:
	grid[x][y] = unit
	

func set_unit_grid_position(unit_x: int, unit_y: int, canvas_x: int, canvas_y: int) -> void:
	grid[unit_x][unit_y].position.x = canvas_x
	grid[unit_x][unit_y].position.y = canvas_y
#	print(str(grid[unit_x][unit_y].stats_component.unit_name, " ", grid[unit_x][unit_y].position))


func get_unit_at_position(x: int, y: int) -> Unit:
	return grid[x][y]


func get_melee_target(attacker_x: int, attacker_y: int) -> Unit:
	return grid[attacker_x][attacker_y]


func get_ranged_target(attacker_x: int, attacker_y: int) -> Unit:
	return grid[attacker_x][attacker_y]


func squad_to_string() -> String:
	var squad_string: String = ""

	for x in range(Constants.GRID_SIZE):
		for y in range(Constants.GRID_SIZE):
			if grid[x][y] != null:
				squad_string = squad_string + str("Unit at ", x, ", ", y, ": ", grid[x][y].stats_component.unit_name, "; ")

	return squad_string
