class_name Player
extends CharacterBody2D

@export_enum("Slow:800", "Average:1000", "Fast:1200") var speed: int : set = set_speed
@onready var steerComponent: SteerComponent = $SteerComponent
@onready var abs_pos_arrow: Node2D = $AbsPosArrow

var is_hover: bool = false
const mass: float = 10

func set_speed(new_speed: int):
	const min_number_speed = 0
	if speed <= min_number_speed:
		print('END OF SPEED', speed, min_number_speed)
	speed = new_speed
	print(speed)
	
func substract_speed(amount_speed_substract: int) -> void:
	var new_speed = speed - amount_speed_substract
	set_speed(new_speed)

func _process(_delta: float) -> void:
	queue_redraw()
	abs_pos_arrow.look_at(get_global_mouse_position())

func _physics_process(_delta):
	if !is_hover:
		$Sprite.rotation = velocity.angle()
		velocity = steerComponent.steer_movement(
		velocity,
		global_position,
		get_global_mouse_position(),
		mass,
		speed)
	else:
		velocity = velocity.lerp(Vector2.ZERO, 1)
	move_and_slide()


func _on_area_2d_mouse_entered() -> void:
	is_hover = true


func _on_area_2d_mouse_exited() -> void:
	is_hover = false


func _on_timer_energy_timeout() -> void:
	const amount_energy_substraction = 100
	substract_speed(amount_energy_substraction)
