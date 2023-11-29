extends Node2D
class_name Unit


@export var current_time: int = 0

var abilities: Array
var pause_timer: bool = false

@onready var health_component = $HealthComponent as HealthComponent
@onready var stats_component = $StatsComponent as StatsComponent
@onready var sprite = $Sprite2D


func _ready():
	health_component.health_changed.connect(on_health_changed)
	GameEvents.start_unit_turn.connect(on_start_turn)
	GameEvents.ability_used.connect(on_end_turn)
#	self.start_unit_turn.connect(on_start_turn)
#	self.end_unit_turn.connect(on_end_turn)
	update_health_display()
	set_sprite()
	
	
func _process(delta):
	increment_turn_timer()


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
	abilities = populate_abilities(unit_data.abilities)

	health_component.max_health = float(unit_data.hp)
	health_component.current_health = health_component.max_health
	return self


func populate_abilities(ability_data) -> Array:
	var new_abilities: Array = []
	var ability_names = ability_data.split(", ")
	
	for ability_name in ability_names:
		var trimmed_ability_name = ability_name.substr(0, ability_name.find(" ("))
		if trimmed_ability_name != "":
			new_abilities.push_front(GameData.abilities[trimmed_ability_name])
		
	return new_abilities


func increment_turn_timer():
	if(pause_timer):
		return
	current_time = current_time + stats_component.speed
#	print(current_time)
	
	if(current_time >= Constants.ACTIVE_TURN):
		GameEvents.emit_start_unit_turn(self)
		print(stats_component.unit_name, " ATB is ", current_time)
		current_time = 0
#	print(stats_component.unit_name, " ATB is ", current_time)

func take_damage(damage_amount: float):
	print(str("Deal Damage: ", damage_amount))
	health_component.damage(damage_amount)


func is_alive():
	return health_component.current_health > 0

	
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


func on_start_turn(unit: Unit):
	pause_timer = true
	
	if(unit.get_instance_id() == get_instance_id()):
		print("Start turn for ", unit.stats_component.unit_name)


func on_end_turn(ability: Ability):
	pause_timer = false
