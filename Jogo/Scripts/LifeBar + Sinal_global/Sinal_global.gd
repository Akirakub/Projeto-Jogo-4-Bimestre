extends Node

signal jogador_acertou
signal jogador_errou
signal morte
signal win
signal errou_fala()
signal vida_mudou(vida:int)
signal trocaA
signal trocaP
signal beat()
signal treme
var p1 = 0
var g1 = 0
var m1 = 0
var w1 = 0
var combo_max1 = 0
# Called when the node enters the scene tree for the first time.

const SAVE_PATH := "user://progresso.cfg"
var fases_liberadas: int = 1 # 1 = só a primeira

func _ready() -> void:
	carregar_progresso()

func liberar_fase(n: int) -> void:
	if n > fases_liberadas:
		fases_liberadas = n
		salvar_progresso()
		

func salvar_progresso() -> void:
	var cfg := ConfigFile.new()
	cfg.set_value("progresso", "fases_liberadas", fases_liberadas)
	cfg.save(SAVE_PATH)

func carregar_progresso() -> void:
	var cfg := ConfigFile.new()
	if cfg.load(SAVE_PATH) == OK:
		fases_liberadas = clampi(cfg.get_value("progresso", "fases_liberadas", 1), 1, 3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
