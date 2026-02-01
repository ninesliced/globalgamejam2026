extends Condition

var parties_vise = ["Oculus, Goutalus, Sentendus"]
var homonymes = ["verre", "ver", "vers", "vert"]

var partie
var homonyme

func _init() -> void:
	
	partie = parties_vise[randi_range(0, parties_vise.size() -1)]
	homonyme = homonymes[randi_range(0, homonymes.size() - 1)]
	
	
func get_text() -> String:
	return "{0} diantrus, mais où est mon {1}.".format(partie, homonyme)
	
func check(_mask: Mask, _conditions):
	
	var mid = Vector2(1028.0-130.0,907.0-128.0)
		
	if homonyme == "verre" :
		if partie == "Oculus" :
			var allEyes = true
			for elem in _mask._elements :
				
				if elem.element_types == MaskElement.ElementType.EYE :
					
					if elem.position.x > mid.x :
						allEyes = false
						
			 return allEyes
		elif partie == "Goutalus" :
			var halformormoth = 0
			for elem in _mask._elements :
				
				if elem.element_types == MaskElement.ElementType.MOUTH :
					
					if elem.position.x > mid.x :
						halformormoth += 1
						
			 return halformormoth >= _mask.count_with_type(MaskElement.ElementType.MOUTH)/2
		else :
			var halforlessnose = 0
			for elem in _mask._elements :
				
				if elem.element_types == MaskElement.ElementType.NOSE :
					
					if elem.position.x > mid.x :
						halforlessnose += 1
						
			 return halforlessnose <= _mask.count_with_type(MaskElement.ElementType.NOSE/2)
	elif homonyme == "ver" :
	
	elif homonyme == "vers" :
	
	else :
		
	
	
