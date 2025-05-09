class_name SteerComponent
extends Node

func steer_movement(
	velocity: Vector2,
	global_position: Vector2,
	target_position: Vector2,
	mass: float,
	max_speed: float = 200.0,
):
	var desired_velocity = target_position - global_position
	var scaled_desired_velocity = desired_velocity.normalized() * max_speed
	
	var steer = (scaled_desired_velocity - velocity) / mass
	return velocity + steer
