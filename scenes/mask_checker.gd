extends Node2D

signal joue_son(nom : String)

var conditions = []
var text = ""
var min_number_of_conditions = 1
var max_number_of_conditions = 3

func _ready():
	generate()

func generate():
	conditions = generate_new_conditions()
	text = get_condition_text()

func generate_new_conditions():
	var _conditions = []
	var possibilities = [0, 1, 2, 3, 4, 5, 6]
	var number_of_conditions = randi_range(min_number_of_conditions, max_number_of_conditions)
	
	for i in range(number_of_conditions):
		var random_i = randi_range(0, possibilities.size()-1)
		var r = possibilities.pop_at(random_i)
		
		match r:
			0:
				_conditions.append(ConditionArchiduchesse.new())
			1: 
				_conditions.append(ConditionJeMeSens.new())
			2: 
				_conditions.append(ConditionDiantre.new())
			3: 
				_conditions.append(ConditionMeteo.new())
			4:
				_conditions.append(ConditionMechant.new())
			5:
				_conditions.append(ConditionLivre.new())
			6:
				_conditions.append(ConditionBouche.new())
	return _conditions


func get_condition_text():
	var s = ""
	for c in conditions:
		s += c.get_text() + " "
	return s


func feedback_audio(score : int):
	if score < 25:
		joue_son.emit("res://assets/sounds/sfx/sfx_fail.ogg")
	else:
		joue_son.emit("res://assets/sounds/sfx/sfx_success.ogg")


func check(_mask: Mask) -> int:
	var resultat = 0
	for cond in conditions:
		var c = cond.check(_mask, conditions)
		if c:
			resultat += 25
		else:
			resultat -= 10
	
	feedback_audio(resultat)
	
	return resultat
