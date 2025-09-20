class_name GameInstanceBase
extends Node

@export var default_map_scene: PackedScene

var map_node: MapBase

func _enter_tree() -> void:
	SceneManager.ChangeScene(default_map_scene)
