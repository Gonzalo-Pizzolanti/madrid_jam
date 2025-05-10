class_name Item
extends Node2D

@export var sprite : CompressedTexture2D
@onready var collect = $area_collect
var default_scale : Vector2 = self.scale


func _ready():
	print('DEFAULT: ', default_scale)

func _unhandled_input(event):
	if event is InputEventKey:
		const input_action_task = KEY_E
		if event.pressed and event.keycode == input_action_task:
			remove()


func remove() -> void:
	var teewn_dissapear = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	teewn_dissapear.tween_property(self, "scale", self.scale * .75, .25)
	teewn_dissapear.tween_property(self, "rotation", 5, .25)
	teewn_dissapear.tween_property(self, "scale", self.scale * 1.25, .15)
	
	await teewn_dissapear.finished
	queue_free()


func _on_area_collect_body_entered(body: Node2D) -> void:
	var teewn_dissapear = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	teewn_dissapear.tween_property(self, "scale", self.scale * .75, .25)



func _on_area_collect_body_exited(body: Node2D) -> void:
	var teewn_dissapear = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	teewn_dissapear.tween_property(self, "scale", Vector2(.35, .35), .25)
