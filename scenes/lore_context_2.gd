extends Sprite2D
var _t = 0.0
var anchor: Vector2

func _ready() -> void:
	anchor = position

func _process(delta: float) -> void:
	_t += delta
	
	position = anchor + Vector2(cos(_t*2), sin(_t)) * 15
