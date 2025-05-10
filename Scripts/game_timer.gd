extends Node2D

@onready var timer: Timer = $Timer
@onready var label: Label = $Label
@onready var audio: AudioStreamPlayer = $AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = str(timer.time_left)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	label.text = str(int(timer.time_left))
	pass

func _on_timer_timeout() -> void:
	print("Time out!")
	audio.play()
	await audio.finished
	world.endgame()
	pass
