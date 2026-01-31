extends Node2D

@export var base_texture : Texture

@onready var _button : Button = $Button
@onready var _mask_element : MaskElement = $Button/MaskElement

@export var _element_param : MaskElementParam

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_mask_element.base_texture = _element_param.base_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
