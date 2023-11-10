extends Button
class_name AbilityButton


var ability: Ability

#@onready var info_label = %InfoLabel


func _ready():
	self.pressed.connect(on_pressed)
#	print("Created ability button ", ability.ability_name, " Damage: ", ability.damage)
#	self.mouse_entered.connect(on_hover)
#	self.mouse_exited.connect(on_blur)


func on_pressed():
	ability.use_ability()


#func on_hover():
#	info_label.text = ability.display_information()
#
#
#func on_blur():
#	info_label.text = ""
