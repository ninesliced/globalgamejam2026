class_name MaskElement
extends Node2D

@export var base_texture : Texture2D

@onready var _sprite_2D : Sprite2D = $Sprite2D

var color : Color

var size : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_sprite_2D.texture = base_texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scale = Vector2(size, size)
