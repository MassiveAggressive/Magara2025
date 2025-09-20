class_name InGamePlayerState extends PlayerStateBase

var player_1_node: Node
var player_2_node: Node

var player_1_input_keys: Dictionary[Util.EInputKey, StringName] = {
	Util.EInputKey.MOVERIGHT: "MoveRight1",
	Util.EInputKey.MOVELEFT: "MoveLeft1",
	Util.EInputKey.JUMP: "Jump1",
	Util.EInputKey.DASH: "Dash1"
}

var player_2_input_keys: Dictionary[Util.EInputKey, StringName] = {
	Util.EInputKey.MOVERIGHT: "MoveRight2",
	Util.EInputKey.MOVELEFT: "MoveLeft2",
	Util.EInputKey.JUMP: "Jump2",
	Util.EInputKey.DASH: "Dash2"
}

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("LeftClick"):
		Gravity.Flip()

func SetPlayerNode(node: Node, player_index: int) -> void:
	if player_index == 0:
		player_1_node = node
		(player_1_node as Player).input_keys = player_1_input_keys
	elif player_index == 1:
		player_2_node = node
		(player_2_node as Player).input_keys = player_2_input_keys
