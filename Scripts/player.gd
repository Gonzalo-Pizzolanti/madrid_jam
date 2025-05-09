class_name Player
extends CharacterBody2D

@export_enum("Slow:200", "Average:400", "Fast:600") var speed: int
@onready var steerComponent: SteerComponent = $SteerComponent

var is_hover: bool = false
const mass: float = 10

func _process(_delta: float) -> void:
	queue_redraw()

func _physics_process(_delta):
	# var direction: Vector2 = (get_global_mouse_position() - global_position)
	# velocity = direction * 7.5
	if !is_hover:
		$Sprite.rotation = velocity.angle()
	else:
		$Sprite.rotation = 0
		velocity = velocity.lerp(get_global_mouse_position(), _delta * 4)

	velocity = steerComponent.steer_movement(
		velocity,
		global_position,
		get_global_mouse_position(),
		mass,
		speed,
	)
	
	move_and_slide()


func _on_mouse_entered() -> void:
	is_hover = true
	print("ENTERED: ", is_hover)

func _on_mouse_exited() -> void:
	is_hover = false
	print("LEAVE: ", is_hover)
