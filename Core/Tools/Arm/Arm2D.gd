@tool
class_name Arm2D
extends Node2D
			
var starting_rotation

func _ready():
	starting_rotation = global_rotation

func _process(delta):
	global_rotation = starting_rotation
