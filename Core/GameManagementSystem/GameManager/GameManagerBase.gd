class_name GameManagerBase extends Node

@export var default_player_state_scene: PackedScene
@export var default_player_scene: PackedScene

var player_state_node: PlayerStateBase
var player_1_node: Node2D
var player_2_node: Node2D

func _enter_tree() -> void:
	pass

func GetPlayerState() -> PlayerStateBase:
	return player_state_node
