class_name ConditionBouche
extends Condition

func _init() -> void:
	pass
	
func get_text() -> String:
	return "Le masque doit parler, mettez une bouche."
	
func check(_mask: Mask, _conditions):
	var nbr_l = 0
	for cond in _conditions :
		for lettre in cond.get_text() :
			if lettre == "l" or lettre == "L" :
				nbr_l += 1
	var nbr_bouche = _mask.count_with_type(MaskElement.ElementType.MOUTH)
	return nbr_bouche > 5 or nbr_bouche > nbr_l
