extends Node

signal PlayerStateReady(PlayerStateBase)
signal PlayerReady(Node)

var player_state_node: PlayerStateBase
var player_1_node: Node
var player_2_node: Node

func SetPlayerState(new_player_state_node: PlayerStateBase) -> void:
	player_state_node = new_player_state_node
	PlayerStateReady.emit(player_state_node)

func GetPlayerState() -> PlayerStateBase:
	return player_state_node

func SetPlayer(new_player_node: Node, player_index: int) -> void:
	if player_index == 0:
		player_1_node = new_player_node
		PlayerReady.emit(player_1_node)
	elif player_index == 1:
		player_2_node = new_player_node
		PlayerReady.emit(player_2_node)
	
func GetPlayer(player_index: int) -> Node:
	if player_index == 0:
		return player_1_node
	elif player_index == 1:
		return player_2_node
	
	return null
