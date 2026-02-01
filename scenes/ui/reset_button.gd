extends Button

var _time = 0.0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_time += delta
	rotation = sin(_time)*0.1
