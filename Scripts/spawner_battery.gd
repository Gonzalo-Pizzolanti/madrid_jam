class_name Spawner_battery
extends Node2D

@export var spawn_active : bool = false
@export var timer_time : int = 2
@export var scene : PackedScene = preload("res://Scenes/battery.tscn")

@export var max_number_batteries : int = 5


func _ready() -> void:
	if not spawn_active:
		$Timer.stop()
	else:
		$Timer.wait_time = timer_time


func _on_timer_timeout() -> void:
	var all_batteries = get_tree().get_nodes_in_group('Battery')
	var number_batteries = all_batteries.size()
	
	if number_batteries >= max_number_batteries:
		return

	add_new_battery_element()


func add_new_battery_element():
	var battery : Battery = scene.instantiate()
	var viewport = get_viewport_rect().size
	var random_x = randi_range(0, viewport.x)
	var random_y = randi_range(0, viewport.y)
	battery.position = Vector2(random_x, random_y)
	world.add_child(battery)
