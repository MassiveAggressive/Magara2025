class_name WindowIconUI
extends ColorRect

var icon_name: String: 
	set(value):
		icon_name = value
		$Label.text = icon_name
		
signal IconClicked(WindowName: String)

func _gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("LeftClick"):
		IconClicked.emit(icon_name)
