extends PanelContainer

signal score_affiche(score : int)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_game_ui_afficher_score(score : int) -> void:
	score_affiche.emit(score)
	visible = true


func _on_game_ui_cacher_score() -> void:
	visible = false
