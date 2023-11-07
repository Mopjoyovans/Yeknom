extends Node2D
class_name Character


var abilities: Array

@onready var health_component = $HealthComponent
@onready var stats_component = $StatsComponent


func _ready():
	health_component.health_changed.connect(on_health_changed)
	update_health_display()
	

func take_damage(damage_amount: float):
	health_component.damage(damage_amount)

	
func update_health_display():
	pass
#	health_bar.value = health_component.get_health_percent()
#	hp_label.text = str(health_component.current_health, "/", health_component.max_health)


func on_health_changed():
	update_health_display()
