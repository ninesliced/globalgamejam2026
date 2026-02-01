extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_mask_checker_joue_son(nom: String) -> void:
	self.stream = load(nom)
	self.playing = true


func _on_game_ui_faire_bruitage(son: String) -> void:
	self.stream = load(son)
	self.playing = true
