extends VBoxContainer
class_name SpriteUnitContainer


var grid_outline_image: Image
var image_texture: ImageTexture

@export var squad: Squad


func _ready():
	grid_outline_image = Image.load_from_file("res://assets/sprites/grid-outline.png")
	image_texture = ImageTexture.create_from_image(grid_outline_image)


func init_sprite_grid():
	for row in Constants.GRID_SIZE:
		var unit_hbox = HBoxContainer.new()
		
		for col in Constants.GRID_SIZE:
			var sprite = TextureRect.new()
			sprite.texture = image_texture
			unit_hbox.add_child(sprite)
			
			if squad.grid_component.get_unit_at_position(row, col) != null:
				call_deferred("set_sprite_pos", sprite, row, col)
#				set_sprite_pos(sprite, row, col)
#				print(sprite.global_position)
#				squad.grid_component.set_unit_grid_position(row, col, position.x, position.y)
#				squad.units[row][col].position.x = position.x
#				squad.units[row][col].position.y = position.y

		add_child(unit_hbox)


func set_sprite_pos(sprite, row, col):
	print(sprite)
	print(sprite.global_position)
	squad.grid_component.set_unit_grid_position(row, col, sprite.global_position)


func on_unit_added(unit: Unit, x: int, y: int) -> void:
	print("on unit added")

