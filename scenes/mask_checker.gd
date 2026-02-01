extends Node2D

var conditions = []
var text = ""
var min_number_of_conditions = 1
var max_number_of_conditions = 1

func _ready():
	generate()

func generate():
	conditions = generate_new_conditions()
	text = get_condition_text()

func generate_new_conditions():
	var _conditions = []
	var possibilities = range(2)
	var number_of_conditions = randi_range(min_number_of_conditions, max_number_of_conditions)
	
	for i in range(number_of_conditions):
		var random_i = randi_range(0, possibilities.size())
		var r = possibilities.pop_at(random_i)
		
		match r:
			0:
				_conditions.append(ConditionArchiduchesse.new())
	
	return _conditions


func get_condition_text():
	var s = ""
	for c in conditions:
		s += c.get_text() + " "
	return s


func check(_mask: Mask) -> bool:
	for cond in conditions:
		var c = cond.check(_mask, conditions)
		if not c:
			return false
	
	return true
