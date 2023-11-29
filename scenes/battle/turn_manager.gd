extends Node


#@export var pause_timer = false
@export var players: Squad
@export var enemies: Squad


func _ready():
	connect_timers(players)
	connect_timers(enemies)


func _process(delta):
	increment_turn_timer()


func connect_timers(squad: Squad):
	pass
#	for unit in squad.units:
#		unit.


func increment_turn_timer():
	pass
