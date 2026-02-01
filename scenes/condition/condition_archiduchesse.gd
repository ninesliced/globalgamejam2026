class_name ConditionArchiduchesse
extends Condition

var prefix1: String
var prefix2: String

var score1: int
var score2: int

func _init() -> void:
	var scores1 = {
		"archi": 3,
		"méga": 2,
		"turbo": 1,
		"giga": 3,
		"super": 2,
		"téra": 0
	}
	var prefixes1 = scores1.keys()
	prefix1 = prefixes1[randi_range(0, prefixes1.size()-1)]
	score1 = scores1[prefix1]
	
	
	var scores2 = {}
	for k in prefixes1:
		if scores1[k] <= score1:
			scores2[k] = scores1[k]
	var prefixes2 = scores2.keys()
	
	prefix2 = prefixes2[randi_range(0, prefixes2.size()-1)]
	score2 = scores2[prefix2]
	

func get_text():
	return "Les chaussettes de la {0}duchesse sont {1}sèches.".format([
		prefix1, prefix2
	])

func check(_mask: Mask, _conditions):
	print("check nez")
	var nb_nez = _mask.count_with_type(MaskElement.ElementType.NOSE)
	return (1 + score1 - score2) == nb_nez
