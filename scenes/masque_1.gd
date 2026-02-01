extends Sprite2D

var _t = 0.0
var anchor: Vector2

@export var offset_t = 0.0
@export var spd = 10.0
@export var delta_sped = 2.0
@export var sx = 1.0
@export var sy = 1.0

func _ready() -> void:
	anchor = position

func _process(delta: float) -> void:
	_t += delta * delta_sped
	
	position = anchor + Vector2(cos(_t)*sx, sin(_t*2)*sy) * spd
