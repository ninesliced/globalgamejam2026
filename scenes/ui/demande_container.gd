extends TextEdit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func affiche_demande(demande : String):
	text = demande


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_game_ui_demande_signal(demande : String) -> void:
	affiche_demande(demande)
