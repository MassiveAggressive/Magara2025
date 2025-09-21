class_name SwitchInputCard extends CardBase

var player_1_input_keys: Dictionary[Util.EInputKey, StringName]
var player_2_input_keys: Dictionary[Util.EInputKey, StringName]

func ApplyEffect() -> void:
	var player_state: InGamePlayerState = GameManager.GetPlayerState() as InGamePlayerState
	
	player_1_input_keys[Util.EInputKey.MOVERIGHT] = player_state.player_1_input_keys[Util.EInputKey.MOVELEFT]
	player_1_input_keys[Util.EInputKey.MOVELEFT] = player_state.player_1_input_keys[Util.EInputKey.MOVERIGHT]
	player_1_input_keys[Util.EInputKey.JUMP] = player_state.player_1_input_keys[Util.EInputKey.JUMP]
	player_1_input_keys[Util.EInputKey.DASH] = player_state.player_1_input_keys[Util.EInputKey.DASH]
	
	player_2_input_keys[Util.EInputKey.MOVERIGHT] = player_state.player_2_input_keys[Util.EInputKey.MOVELEFT]
	player_2_input_keys[Util.EInputKey.MOVELEFT] = player_state.player_2_input_keys[Util.EInputKey.MOVERIGHT]
	player_2_input_keys[Util.EInputKey.JUMP] = player_state.player_2_input_keys[Util.EInputKey.JUMP]
	player_2_input_keys[Util.EInputKey.DASH] = player_state.player_2_input_keys[Util.EInputKey.DASH]
	
	(GameManager.GetPlayer(0) as Player).input_keys = player_1_input_keys
	(GameManager.GetPlayer(1) as Player).input_keys = player_2_input_keys

func RemoveEffect() -> void:
	var player_state: InGamePlayerState = GameManager.GetPlayerState() as InGamePlayerState
	
	player_1_input_keys[Util.EInputKey.MOVERIGHT] = player_state.player_1_input_keys[Util.EInputKey.MOVERIGHT]
	player_1_input_keys[Util.EInputKey.MOVELEFT] = player_state.player_1_input_keys[Util.EInputKey.MOVELEFT]
	player_1_input_keys[Util.EInputKey.JUMP] = player_state.player_1_input_keys[Util.EInputKey.JUMP]
	player_1_input_keys[Util.EInputKey.DASH] = player_state.player_1_input_keys[Util.EInputKey.DASH]
	
	player_2_input_keys[Util.EInputKey.MOVERIGHT] = player_state.player_2_input_keys[Util.EInputKey.MOVERIGHT]
	player_2_input_keys[Util.EInputKey.MOVELEFT] = player_state.player_2_input_keys[Util.EInputKey.MOVELEFT]
	player_2_input_keys[Util.EInputKey.JUMP] = player_state.player_2_input_keys[Util.EInputKey.JUMP]
	player_2_input_keys[Util.EInputKey.DASH] = player_state.player_2_input_keys[Util.EInputKey.DASH]
	
	(GameManager.GetPlayer(0) as Player).input_keys = player_1_input_keys
	(GameManager.GetPlayer(1) as Player).input_keys = player_2_input_keys
