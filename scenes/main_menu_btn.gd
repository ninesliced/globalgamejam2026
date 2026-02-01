extends TextureButton

var _t = 0.0
var anchor: Vector2

func _ready() -> void:
	anchor = position

func _process(delta: float) -> void:
	_t += delta
	
	rotation = cos(_t*2)*0.03
