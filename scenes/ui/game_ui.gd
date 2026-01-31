extends Control

signal done_pressed()
signal desactive()
signal undo_pressed()
signal reset_pressed()
signal demande_signal(demande : String)
signal afficher_score(score : int)
signal cacher_score()
signal commencer()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_done_button_pressed() -> void:
	done_pressed.emit()
	desactive.emit()
	demande_signal.emit("DONE !")


func _on_undo_button_pressed() -> void:
	undo_pressed.emit()
	demande_signal.emit("UNDO")


func _on_reset_button_pressed() -> void:
	reset_pressed.emit()
	demande_signal.emit("RESET")


func _on_main_afficher_score(score) -> void:
	afficher_score.emit(score)


func _on_main_cacher_score() -> void:
	cacher_score.emit()


func _on_button_pressed() -> void:
	commencer.emit()
