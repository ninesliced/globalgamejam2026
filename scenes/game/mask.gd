class_name Mask
extends Node2D

@export var base_texture: Texture2D

@onready var _sprite: Sprite2D = $Sprite2D

var _elements: Array[MaskElement] = []

func _ready() -> void:
	_sprite.texture = base_texture

func _process(delta: float) -> void:
	pass

func add_element(_element):
	_elements.append(_element)
	add_child(_element)


func remove_last_element():
	if _elements.is_empty():
		return
	
	var e = _elements.pop_back()
	e.destroy_self()
	
func hide_mask():
	var tween = get_tree().create_tween()
	tween.tween_property($Sprite2D, "position", Vector2(0, 1000), 1.0)
	
func show_mask():
	var tween = get_tree().create_tween()
	tween.tween_property($Sprite2D, "position", Vector2(0, 0), 1.0)
	
func reset_mask():
	for e in _elements:
		if e:
			e.destroy_self()

	_elements = []
	print("Waow, tu as reset le masque !")
	
func undo():
	print("NAN !")
	
func _on_main_cacher_masque() -> void:
	hide_mask()
	await get_tree().create_timer(1).timeout
	reset_mask()
	await get_tree().create_timer(1).timeout
	show_mask()
	
func _on_main_reset_masque() -> void:
	reset_mask()


func _on_main_undo_masque() -> void:
	undo()


func _condition_at_least_one(cond: Callable):
	for e in _elements:
		if cond.call(e):
			return true
	return false
