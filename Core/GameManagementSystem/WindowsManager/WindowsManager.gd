extends Node

var window_manager_ui_scene: PackedScene = preload("uid://04datns7xrqt")
var window_manager_ui: WindowsManagerUI

var custom_window_ui_scene: PackedScene = preload("uid://ctcpv30qgoo8c")

var windows: Dictionary[String, CustomWindowUI]

func _enter_tree() -> void:
	Canvas.CanvasCreated.connect(CreateWindowManagerUI)

func CreateWindowManagerUI(canvas: CanvasLayer) -> void:
	window_manager_ui = window_manager_ui_scene.instantiate()
	
	canvas.add_child(window_manager_ui)

func AddWindow(window_name: String, node: Node) -> void:
	var custom_window_ui: CustomWindowUI = custom_window_ui_scene.instantiate()
	custom_window_ui.AddChild(node)
	windows[window_name] = custom_window_ui
	
	Canvas.GetCanvas().add_child(custom_window_ui)
	
	window_manager_ui.AddWindowIcon(window_name).IconClicked.connect(OnWindowIconClicked)

func OnWindowIconClicked(window_name: String) -> void:
	windows[window_name].visible = !windows[window_name].visible
