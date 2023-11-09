extends Node2D
class_name Unit


var abilities: Array

@onready var health_component = $HealthComponent as HealthComponent
@onready var stats_component = $StatsComponent as StatsComponent
@onready var sprite = $Sprite2D


func _ready():
	health_component.health_changed.connect(on_health_changed)
	update_health_display()
	set_sprite()
	

func init_child_refs():
	health_component = $HealthComponent as HealthComponent
	stats_component = $StatsComponent as StatsComponent
	sprite = $Sprite2D


func hydrate_unit_data(unit_name_key: String) -> Unit:
	var unit_data = GameData.units[unit_name_key]
	stats_component.unit_name = unit_data.name
	stats_component.attack = int(unit_data.attack)
	stats_component.defense = int(unit_data.defense)
	stats_component.endurance = int(unit_data.endurance)
	stats_component.magic = int(unit_data.magic)
	stats_component.resistance = int(unit_data.resistance)
	stats_component.speed = int(unit_data.speed)
#	abilities = populate_abilities(unit_data.abilities)

	health_component.max_health = float(unit_data.hp)
	health_component.current_health = health_component.max_health
	return self


func take_damage(damage_amount: float):
	health_component.damage(damage_amount)

	
func set_sprite():
	var image = null
	
	match stats_component.unit_name:
		"Warrior":
			image = Image.load_from_file("res://assets/sprites/Knight.png")
		"Priest":
			image = Image.load_from_file("res://assets/sprites/Cid.png")
		"Mage":
			image = Image.load_from_file("res://assets/sprites/Wizard.png")
		"Enforcer":
			image = Image.load_from_file("res://assets/sprites/Enemy.png")
			
	var texture = ImageTexture.create_from_image(image)
	sprite.texture = texture
	sprite.flip_h = true

	
func update_health_display():
	pass
#	health_bar.value = health_component.get_health_percent()
#	hp_label.text = str(health_component.current_health, "/", health_component.max_health)


func on_health_changed():
	update_health_display()
