extends Node2D

signal cacher_masque()
signal undo_masque()
signal reset_masque()

@onready var mask = $Mask
@onready var mask_checker = $MaskChecker

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MaskManager.current_mask = $Mask


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_game_ui_done_pressed() -> void:
	cacher_masque.emit()
	var success = mask_checker.check(null, MaskManager.current_mask)
	print("success ", success)


func _on_game_ui_undo_pressed() -> void:
	mask.remove_last_element()


func _on_game_ui_reset_pressed() -> void:
	reset_masque.emit()
