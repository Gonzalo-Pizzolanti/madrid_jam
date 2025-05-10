class_name World
extends Node2D
const MENU = preload("res://Scenes/intro_ui.tscn")

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_ESCAPE:
			print("Exit Menu")
			get_tree().change_scene_to_packed(MENU)
			
func endgame():
	print("TEST")
	get_tree().change_scene_to_packed(MENU)
	pass
