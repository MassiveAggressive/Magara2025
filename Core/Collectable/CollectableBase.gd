class_name CollectableBase extends Area2D

@export var collectable_icon: Texture2D:
	set(value):
		if value:
			collectable_icon = value
			$Sprite2D.texture = collectable_icon

var collectable_key_ui_scene: PackedScene = preload("uid://bsa88x0p720ph")
var collectable_key_ui: Control

func _ready() -> void:
	$Sprite2D.texture = collectable_icon
	collectable_key_ui = collectable_key_ui_scene.instantiate()
	collectable_key_ui.visible = false
	$KeyPoint.add_child(collectable_key_ui)

func OnAreaEntered(area: Area2D) -> void:
	pass # Replace with function body.

func OnAreaExited(area: Area2D) -> void:
	pass # Replace with function body.

func OnBodyEntered(body: Node2D) -> void:
	collectable_key_ui.visible = true

func OnBodyExited(body: Node2D) -> void:
	collectable_key_ui.visible = false
