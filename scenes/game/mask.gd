class_name Mask
extends Node2D

@export var base_texture: Texture2D

@onready var _sprite: Sprite2D = $Sprite2D

var _elements: Array[MaskElement] = []

func _ready() -> void:
	_sprite.texture = base_texture


func add_element(_element):
	_elements.append(_element)
	add_child(_element)


func remove_last_element():
	if _elements.is_empty():
		return
	_elements.pop_back()
	
func hide_mask():
	position.y = 10000
	
func show_mask():
	position.y = 490
	
func _on_main_cacher_masque() -> void:
	hide_mask()
	await get_tree().create_timer(2).timeout
	show_mask()
	
