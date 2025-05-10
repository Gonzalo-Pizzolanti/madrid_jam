class_name SpeedComponent
extends Node


const speed_values : Dictionary = {
	'min': 0,
	'default': 1200,
	'max': 3600
}
const default_speed : int = speed_values['default']
const max_speed : int = speed_values['max']

var speed : int = default_speed: 
	set = set_speed,
	get = get_speed


func get_speed(): 
	return speed

func set_speed(new_speed : int) -> void:
	const max_speed = speed_values['max']
	const min_speed = speed_values['min']
	
	if new_speed < min_speed:
		speed = min_speed
	
	elif  new_speed > max_speed:
		speed = max_speed
	
	else:
		speed = new_speed
	print("speed: ", speed)

func add_speed(amount_sum : int) -> void:
	speed = speed + amount_sum
	

func remove_speed(amount_substract : int) -> void:
	speed = speed - amount_substract
