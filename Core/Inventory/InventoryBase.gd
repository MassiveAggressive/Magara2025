@tool
class_name InventoryBase extends Node

signal CardAdded(CardBase)

@export var inventory: Dictionary[String, CardBase]

var inventory_ui_scene: PackedScene = preload("uid://bemw52fmn4e58")
var inventory_ui: InventoryUI

@export var card: CardBase

@export_tool_button("Add Card")
var AddCardFunc = AddCard

func _ready() -> void:
	inventory_ui = inventory_ui_scene.instantiate()
	inventory_ui.owner_inventory = self
	
	Canvas.AddChild(inventory_ui)

func AddCard() -> void:
	AddItemToInventory(card)

func AddItemToInventory(card: CardBase) -> bool:
	inventory[card.card_name] = card
	
	CardAdded.emit(card)
	
	return true
