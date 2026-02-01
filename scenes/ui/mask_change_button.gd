extends Button

@export var params : MaskParams

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	icon = params.texture_base

var _time = 0.0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_time += delta
	rotation = sin(_time)*0.1

func _on_pressed() -> void:
	print("J'ai un masque")
	MaskManager.current_mask.update_mask(params.texture_base, params.type)
	
