extends Control
class_name UnitHealth


var texture_rect: TextureRect
var v_box_container: VBoxContainer


var unit: Unit = null


#func _ready():
#	texture_rect = %TextureRect
#	v_box_container = %VBoxContainer
	

func init_refs():
	texture_rect = %TextureRect
	v_box_container = %VBoxContainer


func set_unit(health_unit: Unit):
	unit = health_unit

	if unit == null:
		texture_rect.visible = false
		v_box_container.visible = false
