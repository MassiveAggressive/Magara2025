class_name MovementComponent
extends Node

@export var move_speed: float = 500
@export var rotation_speed: float = 2:
	set(value):
		rotation_speed = value
		angular_rotation_speed = rotation_speed * TAU
var angular_rotation_speed: float

var owner_node: Node2D
var movement_input: Vector2 = Vector2.ZERO

var direction: Vector2

var target_position: Vector2
var target_rotation: float

var move_to_target: bool
var rotate_to_target: bool

func _ready() -> void:
	owner_node = get_parent()
	angular_rotation_speed = rotation_speed * TAU

func AddMovementInput(direction: Vector2, should_rotate: bool = false) -> void:
	movement_input = direction
	
	target_position = Vector2.ZERO
	target_rotation = 0.0
	move_to_target = false
	rotate_to_target = should_rotate

func MoveToPosition(_target_position: Vector2, should_rotate: bool = true) -> void:
	target_position = _target_position
	direction = (target_position - owner_node.global_position).normalized()
	target_rotation = direction.angle()
	
	move_to_target = true
	rotate_to_target = should_rotate

func RotateToPosition(_target_position: Vector2) -> void:
	direction = (_target_position - owner_node.global_position).normalized()
	target_rotation = direction.angle()
	
	rotate_to_target = true

func _process(delta: float) -> void:
	if movement_input != Vector2.ZERO:
		var velocity: Vector2 = movement_input.normalized() * move_speed
		owner_node.position += velocity * delta
	elif move_to_target:
		if (owner_node.global_position - target_position).length() <= move_speed * delta:
			owner_node.global_position = target_position
		else:
			owner_node.global_position += direction.normalized() * move_speed * delta
			
	if rotate_to_target:
		var angle_diff: float = wrapf(target_rotation - owner_node.global_rotation, -PI, PI)
	
		if abs(angle_diff) < angular_rotation_speed * delta:
			owner_node.global_rotation = target_rotation
			rotate_to_target = false
		else:
			owner_node.global_rotation += sign(angle_diff) * angular_rotation_speed * delta
