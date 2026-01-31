extends Button

@onready var _mask_element : MaskElement = $MaskElement

@export var _element_param : MaskElementParam

var _mask_element_scene = load("res://scenes/game/MaskElement.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	icon = _element_param.base_texture
	_mask_element.base_texture = _element_param.base_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_pressed() -> void:
	var s: MaskElement = _mask_element_scene.instantiate()
	s.init_element(_element_param)
	get_tree().current_scene.add_child(s)
	GlobalMaskElement.set_mask_element(s)
