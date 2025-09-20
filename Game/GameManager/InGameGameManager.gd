class_name InGameGameManager extends GameManagerBase

func _enter_tree() -> void:
	player_state_node = default_player_state_scene.instantiate()
	GameManager.SetPlayerState(player_state_node) 
	get_tree().current_scene.add_child(player_state_node)
	
	player_1_node = default_player_scene.instantiate()
	GameManager.SetPlayer(player_1_node, 0) 
	get_tree().current_scene.add_child(player_1_node)
	if !SpawnPoints.spawn_points.is_empty():
		player_1_node.global_position = SpawnPoints.spawn_points[0].global_position
	
	player_state_node.SetPlayerNode(player_1_node, 0)
	
	player_2_node = default_player_scene.instantiate()
	GameManager.SetPlayer(player_2_node, 0) 
	get_tree().current_scene.add_child(player_2_node)
	if !SpawnPoints.spawn_points.is_empty():
		player_2_node.global_position = SpawnPoints.spawn_points[1].global_position
	
	player_state_node.SetPlayerNode(player_2_node, 1)
