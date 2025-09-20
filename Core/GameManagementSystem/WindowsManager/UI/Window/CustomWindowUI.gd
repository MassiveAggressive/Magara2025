class_name CustomWindowUI
extends Control

func AddChild(node: Node) -> void:
	%ContentContainer.add_child(node)

func OnCloseRequested() -> void:
	visible = false
