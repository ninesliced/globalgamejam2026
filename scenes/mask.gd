class_name Mask
extends Node2D

@export var base_texture: Texture2D

@onready var _sprite: Sprite2D = $Sprite2D

# var _elements = Array[MaskElement]

func _ready() -> void:
    _sprite.texture = base_texture
    