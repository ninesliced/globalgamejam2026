extends Timer

signal temps(temps_ecoule : int)

var temps_ecoule : float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	temps_ecoule = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	temps_ecoule = temps_ecoule + delta
	temps.emit(type_convert(temps_ecoule, TYPE_INT))


func _on_main_demarrer_timer() -> void:
	temps_ecoule = 0
	start()
