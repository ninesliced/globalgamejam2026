extends Node2D

var conditions = [
	ConditionNumberOfTypeAndColor.new(
		"Le cours suivra son destin.",
		MaskElement.ElementColor.PINK, 
		MaskElement.ElementType.EYE,
		1
	),
]

func check(_conditions, _mask: Mask) -> bool:
	_conditions = conditions
	for cond in conditions:
		var c = cond.check(_mask, _conditions)
		if not c:
			return false
	
	return true
