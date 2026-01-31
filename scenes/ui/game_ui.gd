extends Control

signal done_pressed()
signal desactive()

signal undo_pressed()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_done_button_pressed() -> void:
	done_pressed.emit()
	desactive.emit()


func _on_undo_button_pressed() -> void:
	undo_pressed.emit()
