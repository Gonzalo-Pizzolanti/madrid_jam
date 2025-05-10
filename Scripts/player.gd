class_name Player
extends CharacterBody2D

@onready var steerComponent: SteerComponent = $SteerComponent
@onready var abs_pos_arrow: Node2D = $AbsPosArrow

var is_hover: bool = false
const mass: float = 20
@export var speed_component: SpeedComponent


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
		speed_component.speed)
	else:
		velocity = velocity.lerp(Vector2.ZERO, 1)
	move_and_slide()


func _on_area_2d_mouse_entered() -> void:
	is_hover = true


func _on_area_2d_mouse_exited() -> void:
	is_hover = false


func _on_timer_energy_timeout() -> void:
	const amount_energy_substraction = 300
	speed_component.remove_speed(amount_energy_substraction)


func _on_collect_area_area_entered(_area: Area2D) -> void:
	const speed_to_add = 1200
	speed_component.add_speed(speed_to_add)
