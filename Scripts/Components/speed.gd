class_name SpeedComponent
extends Node

@export_group('SPEED')
@export var MIN_SPEED : int = 400
@export var INITIAL_SPEED : int = 1200
@export var MAX_SPEED : int = 3600


var speed_values : Dictionary = {
	'min': MIN_SPEED,
	'default': INITIAL_SPEED,
	'max': MAX_SPEED
}
var default_speed : int = speed_values['default']


var speed : int = default_speed: 
	set = set_speed,
	get = get_speed


func get_speed(): 
	return speed

func set_speed(new_speed : int) -> void:
	var max_speed = speed_values['max']
	var min_speed = speed_values['min']
	
	if new_speed < min_speed:
		speed = min_speed
	
	elif  new_speed > max_speed:
		speed = max_speed
	
	else:
		speed = new_speed
	#print("speed: ", speed)

func add_speed(amount_sum : int) -> void:
	speed = speed + amount_sum
	

func remove_speed(amount_substract : int) -> void:
	speed = speed - amount_substract
