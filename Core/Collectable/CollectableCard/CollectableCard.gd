@tool
class_name CollectableCard extends CollectableBase

@export var card: CardBase

func OnAreaEntered(area: Area2D) -> void:
	pass # Replace with function body.

func OnAreaExited(area: Area2D) -> void:
	pass # Replace with function body.

func OnBodyEntered(body: Node2D) -> void:
	if body as Player:
		var inventory: InventoryBase = GameManager.GetPlayerState().find_children("", "InventoryBase")[0]
		inventory.AddItemToInventory(card)
		queue_free()

func OnBodyExited(body: Node2D) -> void:
	pass # Replace with function body.
