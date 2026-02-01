class_name ConditionMechant
extends Condition

func _init() -> void:
	pass
	
func repeatstr(str, n):
	var s = ""
	for i in range(n):
		s += str
	return s
	
func get_text() -> String:
	return "Grr{0}".format([repeatstr("r",8)])
	
func check(_mask: Mask, _conditions):
	var chapo = _mask.count_with_color_and_type(MaskElement.ElementColor.BLUE,MaskElement.ElementType.ACCESSORY)
	var chev = _mask.count_with_type(MaskElement.ElementType.HAIR)
	
	return chapo >= 1 or chev >= 1
