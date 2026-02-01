extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_game_ui_afficher_score(score: int) -> void:
	text = str("SCORE : ", score)
	if score < 100:
		text = str(text, "\n Allez, t'auras plus de chance la prochaine fois !")
	elif score < 200:
		text = str(text, "\n Pas mal, mais je suis sûr que tu peux mieux faire !")
	elif score < 400 :
		text = str(text, "\n Bien ! Encore une autre ?")
	elif score < 500 :
		text = str(text, "\n Joli ! Encore une autre ?")
	elif score < 600:
		text = str(text, "\n Superbe ! Tu veux encore jouer ?")
	elif score < 800:
		text = str(text, "\n ENORME. Tu veux encore jouer ?")
	elif score < 1000:
		text = str(text, "\n Euh... vas toucher de l'herbe.")
	else:
		text = str(text, "\n Y'a triche monsieur l'arbitre")
