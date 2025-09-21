class_name CollectableRevive extends CollectableBase

var player: Player
var player_in: bool = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interaction1") or event.is_action_pressed("Interaction2"):
		if player == GameManager.GetPlayer(0):
			(GameManager.GetPlayer(1) as Player).Revive()
		if player == GameManager.GetPlayer(1):
			(GameManager.GetPlayer(0) as Player).Revive()

func OnBodyEntered(body: Node2D) -> void:
	super.OnBodyEntered(body)
	player = body as Player
	
	if player:
		player_in = true

func OnBodyExited(body: Node2D) -> void:
	super.OnBodyExited(body)
