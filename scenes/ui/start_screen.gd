extends PanelContainer


func _on_game_ui_afficher_score(score: int) -> void:
	show()
	set_process(true)


func _on_game_ui_cacher_score() -> void:
	hide()
	set_process(false)
