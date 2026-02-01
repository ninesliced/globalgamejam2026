extends Node2D

signal cacher_masque()
signal undo_masque()
signal reset_masque()
signal demarrer_timer()
signal afficher_score(score : int)
signal cacher_score()
signal modif_score(score : int)

@onready var mask = $Mask
@onready var mask_checker = $MaskChecker
@onready var game_ui = $GameUI

var score_total = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MaskManager.current_mask = $Mask
	generate_new_condition()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print("erzre ", mask_checker.text)


func _on_game_ui_done_pressed() -> void:
	cacher_masque.emit()


func _on_game_ui_undo_pressed() -> void:
	mask.remove_last_element()


func _on_game_ui_reset_pressed() -> void:
	reset_masque.emit()


func _on_timer_timeout() -> void:
	afficher_score.emit(100)


func _on_game_ui_commencer() -> void:
	cacher_score.emit()
	demarrer_timer.emit()


func assign_dialog_text(text: String):
	game_ui.assign_dialog_text(text)


func _on_mask_signal_evaluer_masque() -> void:
	score_total = score_total + mask_checker.check(mask)
	modif_score.emit(score_total) 

func _on_mask_signal_nouvelles_demandes() -> void:
	generate_new_condition()

func generate_new_condition():
	mask_checker.generate()
	assign_dialog_text(mask_checker.text)
