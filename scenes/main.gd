extends Node2D

signal cacher_masque()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_game_ui_done_pressed() -> void:
	cacher_masque.emit()
