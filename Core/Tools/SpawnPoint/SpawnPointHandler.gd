@tool
class_name SpawnPointHandler
extends Node

var spawn_points: Array[SpawnPoint]

func AddSpawnPoint(new_point: SpawnPoint):
	spawn_points.append(new_point)
