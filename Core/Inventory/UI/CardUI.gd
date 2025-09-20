@tool
class_name CardUI extends ColorRect

@export var card_name: String
@export var card: CardBase

func SetCard(_card: CardBase) -> void:
	card_name = _card.card_name
	card = _card
	
	$Label.text = card_name[0]
