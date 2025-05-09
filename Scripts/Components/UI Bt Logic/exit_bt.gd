extends Button
@onready var button_sound: AudioStreamPlayer = $ButtonSound


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	button_sound.playing = true
	await button_sound.finished
	print("Closing game")
	get_tree().quit()
	pass # Replace with function body.
