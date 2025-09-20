class_name WindowsManagerUI extends Control

var window_icon_ui_scene: PackedScene = preload("uid://8jwhg3a815yv")

func AddWindowIcon(window_name: String) -> WindowIconUI:
	var window_icon_ui: WindowIconUI = window_icon_ui_scene.instantiate()
	window_icon_ui.icon_name = window_name
	
	add_child(window_icon_ui)
	
	return window_icon_ui
