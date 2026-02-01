extends Node2D

var left_click_just_pressed : bool
var current_mask_element : MaskElement 

var marker_1 : Vector2 = Vector2(1028.0,907.0)
var marker_2 : Vector2 = Vector2(130.0,128.0) 

func set_mask_element(elem : MaskElement):
	if not current_mask_element:
		current_mask_element = elem
	else:
		current_mask_element.destroy_self()
		current_mask_element = elem


func place_element():
	if not current_mask_element :
		return
	
	MaskManager.current_mask.add_element(current_mask_element)
	current_mask_element = null

func is_in_area(pos : Vector2) :
	return marker_2.x < pos.x and pos.x < marker_1.x and marker_2.y < pos.y and pos.y < marker_1.y

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		left_click_just_pressed = event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				if current_mask_element :
					current_mask_element.rotate_sprite(22.5)
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
				if current_mask_element :
					current_mask_element.rotate_sprite(-22.5)
