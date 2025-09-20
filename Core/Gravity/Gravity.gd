extends Node

signal GravityChanged

var gravity: float = -980
var flipped: bool

func Flip() -> void:
	flipped = !flipped
	gravity *= -1
	GravityChanged.emit()
