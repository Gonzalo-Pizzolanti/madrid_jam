class_name Player
extends CharacterBody2D

@export_enum("Slow:800", "Average:1000", "Fast:1200") var speed: int
@onready var steerComponent: SteerComponent = $SteerComponent

var is_hover: bool = false
const mass: float = 10

func _process(_delta: float) -> void:
	queue_redraw()

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
