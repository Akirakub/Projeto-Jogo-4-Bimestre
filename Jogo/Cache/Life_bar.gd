extends TextureProgressBar

var vida: int = 7

func _ready() -> void:
	
	SinalGlobal.jogador_errou.connect(_on_jogador_errou)

func _on_jogador_errou() -> void:
	vida -= 1
	value = vida
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
