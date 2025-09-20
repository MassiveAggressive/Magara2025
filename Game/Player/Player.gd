class_name Player extends CharacterBody2D

@export var move_speed: float = 200.0
@export var jump_force: float = 400.0
@export var gravity: float = 980.0

@export var dash_speed: float = 600.0
@export var dash_time: float = 0.15
@export var dash_cooldown: float = 0.4

var facing_right: bool = true
var is_dashing: bool = false
var dash_timer: float = 0.0
var dash_cooldown_timer: float = 0.0
var dash_dir: int = 1

var gravity_dir: int = 1

var input_keys: Dictionary[Util.EInputKey, StringName] = {
	Util.EInputKey.MOVERIGHT: "MoveRight1",
	Util.EInputKey.MOVELEFT: "MoveLeft1",
	Util.EInputKey.JUMP: "Jump1",
	Util.EInputKey.DASH: "Dash1"
}

func _ready() -> void:
	Gravity.GravityChanged.connect(toggle_gravity)

func _physics_process(delta: float) -> void:
	_process_input()

	if is_dashing:
		_process_dash(delta)
	else:
		_process_move_and_jump(delta)
	
	up_direction = Vector2.UP * gravity_dir
	
	move_and_slide()

func _process_input() -> void:
	var input_axis = Input.get_action_strength(input_keys[Util.EInputKey.MOVERIGHT]) - Input.get_action_strength(input_keys[Util.EInputKey.MOVELEFT])
	velocity.x = input_axis * move_speed

	if input_axis != 0:
		facing_right = input_axis > 0
	
	if Input.is_action_just_pressed(input_keys[Util.EInputKey.JUMP]) and is_on_floor():
		velocity.y = -jump_force * gravity_dir
	
	if Input.is_action_just_pressed(input_keys[Util.EInputKey.DASH]) and not is_dashing and dash_cooldown_timer <= 0.0:
		_start_dash()

func _process_move_and_jump(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * gravity_dir * delta
	
	if dash_cooldown_timer > 0.0:
		dash_cooldown_timer -= delta

func _start_dash() -> void:
	is_dashing = true
	dash_timer = dash_time
	dash_cooldown_timer = dash_cooldown
	
	dash_dir = 1 if facing_right else -1
	velocity = Vector2(dash_dir * dash_speed, 0)

func _process_dash(delta: float) -> void:
	velocity = Vector2(dash_dir * dash_speed, 0)
	
	dash_timer -= delta
	if dash_timer <= 0.0:
		_end_dash()

func _end_dash() -> void:
	is_dashing = false

func toggle_gravity():
	gravity_dir *= -1
