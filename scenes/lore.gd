extends Node2D


var lore_scene = load("res://scenes/main.tscn")

func _on_play_pressed() -> void:
	TransitionManager.change_scene(lore_scene)
