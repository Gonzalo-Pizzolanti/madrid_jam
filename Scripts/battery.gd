class_name Battery
extends CharacterBody2D

const speed_amount_add : int = 400
var incremental_velocity : float = 5


func _on_range_getter_area_entered(area: Area2D) -> void:
	if area is Collect_Area:
		remove()


func remove():
	var teewn_dissapear = create_tween().set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN)
	teewn_dissapear.tween_property(self, "scale", self.scale * 1.25, .25)
	teewn_dissapear.tween_property(self, "scale", self.scale / 6, .1)
	await teewn_dissapear.finished
	queue_free()
	
