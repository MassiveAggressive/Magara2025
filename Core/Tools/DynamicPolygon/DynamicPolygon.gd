@tool
class_name DynamicPolygon
extends Polygon2D

@export_range(3, 32, 1) var edge_count: int = 4:
	set(value):
		edge_count = clamp(value, 3, 32)
		rotation_offset = 360 / edge_count / 2
		update_polygon()

@export var radius: float = 50.0:  # Apotem (kenarın merkeze uzaklığı)
	set(value):
		radius = value
		update_polygon()

@export_range(0, 360, 1) var rotation_offset: float = 0.0:
	set(value):
		rotation_offset = value
		update_polygon()

@export var shape_color: Color = Color.WHITE:
	set(value):
		shape_color = value
		color = shape_color

func _ready():
	update_polygon()

func update_polygon():
	# 1. Apotem'i yarıçapa çevir (a = r * cos(π/n) => r = a / cos(π/n))
	var n = edge_count
	var r = radius / cos(PI / n)
	
	# 2. Noktaları hesapla (rotation_offset dikkate alınarak)
	var points = PackedVector2Array()
	var base_angle = deg_to_rad(rotation_offset) - PI/2
	
	for i in range(n):
		var angle = (TAU / n * i) + base_angle
		var point = Vector2(
			cos(angle) * r,
			-sin(angle) * r  # Godot'un Y ekseni aşağı olduğu için "-"
		)
		points.append(point)
	
	# 3. Polygon ve renk güncelle
	polygon = points
