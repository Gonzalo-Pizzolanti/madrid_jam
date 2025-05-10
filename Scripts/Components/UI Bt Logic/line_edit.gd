extends LineEdit
@onready var info_panel: PanelContainer = $InfoPanel
@onready var info: Label = $InfoPanel/Info



func _on_text_submitted(new_text: String) -> void:
	if (new_text != null and new_text != ""):
		print("Cambiado")
		PlayerName.username = new_text
		clear()
		placeholder_text = new_text
		info_panel.visible = true; 
		info.text = "¡Nombre cambiado!"
		await get_tree().create_timer(5).timeout 
		info_panel.visible = false; 
	else:
		print("NO cambiado")
		info_panel.visible = true; 
		info.text = "El nombre no es válido"
		await get_tree().create_timer(5).timeout 
		info_panel.visible = false; 
	pass # Replace with function body.


func _on_intro_ui_ready() -> void:
	placeholder_text = PlayerName.username
	pass # Replace with function body.
