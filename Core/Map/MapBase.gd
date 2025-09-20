class_name MapBase
extends Node

@export var default_game_manager_scene: PackedScene = preload("uid://c12fgejkbij4y")

var game_manager_node: GameManagerBase
	
func _ready() -> void:
	game_manager_node = default_game_manager_scene.instantiate()
	get_tree().current_scene.add_child(game_manager_node)
