class_name ConditionMeteo
extends Condition

var meteo: String

func _init() -> void:
	var meteos_possibles = [
		"il fait beau",
		"il fait beau",
		"il fait beau",
		"il fait acide",
		"il fait amer",
		"il fait pluie",
		"il fait moche",
		"il fait feur",
	]
	meteo = meteos_possibles[randi_range(0, meteos_possibles.size()-1)]

func get_text():
	return "Aujourd’hui {0}.".format([meteo])

func check(_mask: Mask, _conditions):
	var c = _mask.count_with_color_and_type(
		MaskElement.ElementColor.YELLOW, 
		MaskElement.ElementType.EYE
	)
	return c > 1
