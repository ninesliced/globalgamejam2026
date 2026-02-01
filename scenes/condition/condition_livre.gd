class_name ConditionLivre
extends Condition

var state
var phrase

func _init() -> void:
	state = randi_range(0,1)
	
	if state == 0 :
		phrase = "Du sel, il m’en faut un livre"
	else :
		phrase = "Comment utiliser du sel ? Il me faut un livre !"
	
func repeatstr(str, n):
	var s = ""
	for i in range(n):
		s += str
	return s
	
func get_text() -> String:
	return "{0}".format([phrase])
	
func check(_mask: Mask, _conditions):
	var nbr_corne = _mask.count_with_type(MaskElement.ElementType.HORN)
	var nbr_oeuil = _mask.count_with_type(MaskElement.ElementType.EYE)
	if state == 0 :
		return nbr_corne <= 3 and nbr_corne <= nbr_oeuil
	else :
		var liste_bouche = []
		for elem in _mask._elements :
			if elem.element_types.has(MaskElement.ElementType.MOUTH) :
				liste_bouche.append(elem)
		
		var count = 0
		for elem1 in liste_bouche :
			for elem2 in _mask._elements :
				if elem2.element_types.has(MaskElement.ElementType.NOSE) :
					count += 1
		return count == _mask.count_with_type(MaskElement.ElementType.HORN)
