@tool
class_name SpawnPoint
extends Node2D

func _init() -> void:
	SpawnPoints.AddSpawnPoint(self)
