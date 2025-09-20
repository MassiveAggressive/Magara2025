extends Node

signal CanvasCreated(canvas: CanvasLayer)

var canvas: CanvasLayer

func _enter_tree() -> void:
	SceneManager.SceneChanged.connect(OnSceneChanged)
	CreateCanvas()

func CreateCanvas() -> void:
	canvas = CanvasLayer.new()
	canvas.name = "DefaultCanvasLayer"
	
	get_tree().current_scene.add_child(canvas)
	
	CanvasCreated.emit(canvas)

func GetCanvas() -> CanvasLayer:
	return canvas

func AddChild(node: Node) -> void:
	canvas.add_child(node)

func OnSceneChanged() -> void:
	CreateCanvas()
