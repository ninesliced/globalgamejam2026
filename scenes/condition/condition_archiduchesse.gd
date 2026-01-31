class_name ConditionArchiduchesse
extends Condition

var text: String
var color: MaskElement.ElementColor
var typ: MaskElement.ElementType
var min_count: int

func _init(
		text: String, 
		color: MaskElement.ElementColor, 
		typ: MaskElement.ElementType, 
		min_count: int = 1
) -> void:
	text = text
	color = color
	typ = typ
	min_count = min_count

func get_text():
	return 

func check(_mask: Mask, _conditions):
	return _mask.count_with_color_and_type(color, typ) >= 1
