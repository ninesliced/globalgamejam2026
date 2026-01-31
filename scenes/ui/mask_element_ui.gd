extends Button

@export var base_texture : Texture

@onready var _mask_element : MaskElement = $MaskElement

@export var _element_param : MaskElementParam

var _mask_element_scene = load("res://scenes/game/MaskElement.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_mask_element.base_texture = _element_param.base_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	

func _on_pressed() -> void:
	var s = _mask_element_scene.instantiate()
	s.base_texture = _element_param.base_texture
	GlobalMaskElement.set_mask_element(s)
