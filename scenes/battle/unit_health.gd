extends Control
class_name UnitHealth


var sprite_size: int = 32


func _ready():
	custom_minimum_size.x = sprite_size * 2
	custom_minimum_size.y = sprite_size
	display_sprite()
	display_health_container()


func display_sprite():
	var unit_image = Image.load_from_file("res://assets/sprites/32 placeholder.png")
	var texture_rect = TextureRect.new()
	texture_rect.texture = ImageTexture.create_from_image(unit_image)
	add_child(texture_rect)


func display_health_container():
	var vbox = VBoxContainer.new()
#	vbox.set_anchors_preset(Control.PRESET_CENTER_RIGHT)
	
	vbox.add_child(generate_label())
	vbox.add_child(generate_progress_bar())
	add_child(vbox)


func generate_label() -> Label:
	var label = Label.new()
	label.text = "32/32"
	return label


func generate_progress_bar() -> ProgressBar:
	var progress_bar = ProgressBar.new()
	progress_bar.max_value = 1
	progress_bar.value = 0.5
	return progress_bar
