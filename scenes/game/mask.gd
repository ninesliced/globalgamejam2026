class_name Mask
extends Node2D

@onready var _sprite: Sprite2D = $Sprite2D



var type : MaskParams.MaskType

var _elements: Array[MaskElement] = []


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func update_mask(base_texture, _type) :
	if not MaskManager.has_mask :
		MaskManager.has_mask = true
		
	print("J'ai un masque")
	_sprite.texture = base_texture
	type = _type
	

func add_element(_element: MaskElement):
	if not _element:
		return
		
	if not MaskManager.has_mask :
		return
		
	_elements.append(_element)
	var p = Vector2(_element.global_position)
	_element.reparent(self)
	_element.global_position = p
	
	await get_tree().create_timer(0.05).timeout
	_element.global_position = p
	

func remove_last_element():
	if _elements.is_empty():
		return
	
	var e = _elements.pop_back()
	e.destroy_self()
	
func hide_mask():
	var tween = get_tree().create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.tween_property(self, "position", Vector2(600, 2000), 1.0)

func show_mask():
	var tween = get_tree().create_tween()
	tween.set_trans(Tween.TRANS_BACK)
	tween.tween_property(self, "position", Vector2(600, 540), 1.0)

func reset_mask():
	if not MaskManager.has_mask :
		return
	
	for e in _elements:
		if e:
			e.destroy_self()
	_elements = []

func alea_demande():
	pass

func nouvelles_demandes():
	pass

func evaluer_masque():
	pass
	# Couleur
	# Yeux
	# Bouche
	# Oreilles
	# Cornes/Décorations
	# Reste


# Réactions aux signaux

func _on_main_cacher_masque() -> void:
	hide_mask()
	await get_tree().create_timer(1).timeout
	evaluer_masque()
	await get_tree().create_timer(1).timeout
	reset_mask()
	nouvelles_demandes()
	await get_tree().create_timer(1).timeout
	show_mask()


func _on_main_reset_masque() -> void:
	reset_mask()


func count_with_color_and_type(color: MaskElement.ElementColor, typ: MaskElement.ElementType):
	var count = 0
	for e in _elements:
		if e.color == color and e.element_types.has(typ	):
			count += 1
	return count


func count_with_color(color: MaskElement.ElementColor):
	var count = 0
	for e in _elements:
		if e.color == color:
			count += 1
	return count


func count_with_type(typ: MaskElement.ElementType):
	var count = 0
	for e in _elements:
		if e.element_types.has(typ):
			count += 1
	return count
