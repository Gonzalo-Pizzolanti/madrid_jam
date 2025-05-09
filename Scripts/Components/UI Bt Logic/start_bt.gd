extends Button
@onready var start_sound: AudioStreamPlayer = $StartSound
const WORLD = preload("res://Scenes/world.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pressed() -> void:
	start_sound.playing=true
	await start_sound.finished
	get_tree().change_scene_to_packed(WORLD)
	print("Game starting")
	pass # Replace with function body.
