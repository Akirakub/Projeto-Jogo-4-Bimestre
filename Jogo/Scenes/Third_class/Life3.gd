extends TextureProgressBar

var vida: int = 7
var morreu: bool = false 

func _ready() -> void:
	max_value = 7 # 
	value = vida # 
	SinalGlobal.jogador_errou.connect(_on_jogador_errou)
	SinalGlobal.jogador_acertou.connect(_on_jogador_acertou)
	SinalGlobal.vida_mudou.emit(vida) 
	

func _on_jogador_acertou() -> void:
	vida = min(vida + 1, 7) 
	value = vida
	SinalGlobal.vida_mudou.emit(vida) 

func _on_jogador_errou() -> void:
	vida -= 1 
	value = vida
	SinalGlobal.vida_mudou.emit(vida) 
	if vida == 2: 
		SinalGlobal.trocaA.emit()
		SinalGlobal.trocaP.emit()
	#print(vida,"vida")
	
	if value <= 0:
		_on_morte()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_morte() -> void:
	if morreu: 
		return
	morreu = true 
	if SinalGlobal.jogador_errou.is_connected(_on_jogador_errou):
		SinalGlobal.jogador_errou.disconnect(_on_jogador_errou)
	print(vida)
	SinalGlobal.morte.emit()
	print("Morreu")
	get_tree().call_deferred("change_scene_to_file", "res://Scenes/Third_class/game_over3.tscn") 
	
func _process(_delta: float) -> void:
	pass
