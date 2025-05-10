class_name Spawner_battery
extends Node2D

@export var spawn_active : bool = false
@export var timer_time : int = 2
var scene = preload("res://Scenes/battery.tscn")


func _ready() -> void:
	if not spawn_active:
		$Timer.stop()
	else:
		$Timer.wait_time = timer_time
			
func _on_timer_timeout() -> void:
	var instance = scene.instantiate()
	var viewport = get_viewport_rect().size
	var random_x = randi_range(0, viewport.x)
	var random_y = randi_range(0, viewport.y)
	instance.position = Vector2(random_x, random_y)
	world.add_child(instance)
