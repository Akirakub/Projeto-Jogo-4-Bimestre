extends Camera2D


var intensidade_shake: float = 0.0

var decay_shake: float = 5.0


func _ready() -> void:
	SinalGlobal.treme.connect(_on_treme)


func _on_treme() -> void:
	aplicar_shake(4.0)
	
func _process(delta: float) -> void:
	if intensidade_shake > 0:
		
		intensidade_shake = move_toward(intensidade_shake, 0.0, decay_shake * delta)
		
	
		offset.x = randf_range(-intensidade_shake, intensidade_shake)
		offset.y = randf_range(-intensidade_shake, intensidade_shake)
		
	else:
		offset = Vector2.ZERO


func aplicar_shake(forca: float, sumir: float = 5.0) -> void:
	intensidade_shake = forca
	decay_shake = sumir
