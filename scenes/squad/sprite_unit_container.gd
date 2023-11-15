extends VBoxContainer
class_name SpriteUnitContainer


@export var squad: Squad


func init_sprite_grid():
	var grid_size = squad.grid_component.grid_size
	var cell_size = squad.grid_component.cell_size
	
	for row in grid_size:
		var unit_hbox = HBoxContainer.new()
		
		for col in grid_size:
			var sprite = TextureRect.new()
			var image = Image.load_from_file("res://assets/sprites/grid-outline.png")
			var texture = ImageTexture.create_from_image(image)
			sprite.texture = texture
			unit_hbox.add_child(sprite)
		add_child(unit_hbox)


func on_unit_added(unit: Unit, x: int, y: int) -> void:
	print("on unit added")

