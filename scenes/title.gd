extends Node2D

var lore_scene = load("res://scenes/lore.tscn")

func _on_play_pressed() -> void:
	TransitionManager.change_scene(lore_scene)


func _on_credits_pressed() -> void:
	var x: Sprite2D = $MenuCredits 
	if x.visible:
		x.hide()
	else:
		x.show()
