extends Node


var abilities = {}
var units = {}

var ability_data_path = "res://data/Abilities.csv"
var unit_data_path = "res://data/Units.csv"


func _ready():
	abilities = load_csv_data(ability_data_path)
	units = load_csv_data(unit_data_path)


func load_csv_data(path: String):
	var data = {}

	if FileAccess.file_exists(path):
		var file = FileAccess.open(path, FileAccess.READ)
		var header_found: bool = false
		var headers = []
		
		while !file.eof_reached():
			var data_set = Array(file.get_csv_line())
			if not header_found:
				headers = data_set
				header_found = true
			else:
				var csv_line = {}
				var index = 0
				for label in headers:
					csv_line[label] = data_set[index]
					index += 1
				data[csv_line["name"]] = csv_line
		file.close()
		
#		print(data)

	else:
		print("Data file not found")
		
	return data
