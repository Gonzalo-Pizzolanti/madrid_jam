class_name Player
extends CharacterBody2D

@export_enum("Slow:200", "Average:400", "Fast:600") var speed: int
@onready var steerComponent: SteerComponent = $SteerComponent

var sprite_rotation = func(velocity): return velocity

const mass: float = 10

func _process(_delta: float) -> void:
	queue_redraw()

func _physics_process(_delta):
	# var direction: Vector2 = (get_global_mouse_position() - global_position)
	# velocity = direction * 7.5
	$Sprite.rotation = velocity.angle()

	velocity = steerComponent.steer_movement(
		velocity,
		global_position,
		get_global_mouse_position(),
		mass,
		speed,
	)
	
	move_and_slide()


func _on_mouse_entered() -> void:
	pass # Replace with function body.
