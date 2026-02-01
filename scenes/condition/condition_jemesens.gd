class_name ConditionJeMeSens
extends Condition

var sentiment : String
var sentiments = [
		"joyeux", "heureux", "mélancholicus"
	]
	
# Called when the node enters the scene tree for the first time.
func _init() -> void:
	sentiment = sentiments[randi_range(0, 2)]
	
func get_text() -> String:
	return "Je me sens {0}.".format([sentiment])
	
func check(_mask: Mask, _conditions):
	var nbr_oeuil = _mask.count_with_type(MaskElement.ElementType.EYE)
	
	if sentiment == sentiments[0] :
		return nbr_oeuil >= 2
	elif  sentiment == sentiments[1] :
		return nbr_oeuil <= 2
	else :
		return nbr_oeuil == 1
