class_name InventoryUI extends HBoxContainer

var owner_inventory: InventoryBase

var inventory: Dictionary[String, CardUI]

var card_ui_scene: PackedScene = preload("uid://b2d5awuwyk40s")

func _ready() -> void:
	owner_inventory.CardAdded.connect(AddItemToInventory)

func AddItemToInventory(card: CardBase) -> void:
	var new_card_ui: CardUI = card_ui_scene.instantiate()
	
	new_card_ui.SetCard(card)

	inventory[card.card_name] = new_card_ui
	
	add_child(new_card_ui)
