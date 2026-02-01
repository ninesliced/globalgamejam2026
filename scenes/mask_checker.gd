extends Node2D

var conditions = [
	ConditionArchiduchesse.new()
]

func generate_new_conditions() -> Array[Condition]:
	var conditions = []
	
	var number_of_conditions = randi_range(3, 6)
	for i in range(number_of_conditions):
		add_new_condition(conditions)
	
	return conditions

func add_new_condition(conditions):
	pass


func check(_conditions, _mask: Mask) -> bool:
	_conditions = conditions
	for cond in conditions:
		var c = cond.check(_mask, _conditions)
		if not c:
			return false
	
	return true
