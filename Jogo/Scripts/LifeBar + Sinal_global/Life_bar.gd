extends TextureProgressBar

var vida: int = 7

func _ready() -> void:
	SinalGlobal.jogador_errou.connect(_on_jogador_errou)
	SinalGlobal.jogador_acertou.connect(_on_jogador_acertou)
	

func _on_jogador_acertou() -> void:
	if value <= 7:
		vida += 1
		value = vida
func _on_jogador_errou() -> void:
	if vida <= 7:
		vida -= 1
		value = vida
	else: 
		vida = 7
		vida = 1
		value = vida
	#print(vida,"vida")
	
	if value <= 0:
		_on_morte()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_morte() -> void:
	if SinalGlobal.jogador_errou.is_connected(_on_jogador_errou):
		SinalGlobal.jogador_errou.disconnect(_on_jogador_errou)
	print(vida)
	SinalGlobal.morte.emit()
	print("Morreu")
	get_tree().change_scene_to_file("res://Scenes/Menu_Scenes/game_over.tscn")
	
func _process(_delta: float) -> void:
	pass
