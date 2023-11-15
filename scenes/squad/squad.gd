extends Node2D
class_name Squad


var units: Array[Unit]
#var units = []
var active_unit: Unit

@onready var grid_component = %GridComponent as GridComponent


#func _ready():
#	for x in range(Constants.GRID_SIZE):
#		units.append([])
#		for y in range(Constants.GRID_SIZE):
#			units[x].append(null)


func add_unit(unit: Unit, coords):
	unit.health_component.died.connect(on_unit_died)
#	unit.position.x = coords[0]
#	unit.position.y = coords[1]
	
	units.append(unit)
#	units[coords[0]][coords[1]] = unit
	add_child(unit)
	grid_component.add_unit_at_position(unit, coords[0], coords[1])
	
	if active_unit == null:
		active_unit = unit
	
	if active_unit == null:
		set_active_unit(unit)


func set_active_unit(unit: Unit):
	active_unit = unit
#	active_unit_set.emit(unit)


func set_new_active_unit():
	for unit in units:
		if unit != null and unit.is_alive():
			set_active_unit(unit)
			return
	print("team is all dead!")


func get_active_unit() -> Unit:
	return active_unit


func get_unit_by_name(unit_name: String) -> Unit:
	for unit in units:
		if unit.unit_name == unit_name:
			return unit
			
	return null


func on_unit_died():
	if active_unit != null and !active_unit.is_alive():
		set_new_active_unit()
