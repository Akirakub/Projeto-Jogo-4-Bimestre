extends Node2D 

@onready var pointer: Sprite2D = $Pointer
@onready var start_marker: Marker2D = $StartMarker
@onready var end_marker: Marker2D = $EndMarker
@onready var safe_start_marker: Marker2D = $SafeStartMarker
@onready var safe_end_marker: Marker2D = $SafeEndMarker

# Caminho até o AudioStreamPlayer
@export var metronome_path: NodePath = NodePath("../AudioStreamPlayer")

# Metade da janela do perfect em segundos
@export var meia_janela_safe: float = 0.25

# tempo de aproximação fora da zona verde em segundos, quanto maior mais devagar o ponteiro anda fora dela
@export var antecedencia: float = 1.5

var metronome # variavel pra guardar o AudioStreamPlayer da fase sem tipo de propósito pra poder ler as variáveis do script dele
var alvos: Array[float] = [] # lista com o tempo em segundos de todos os beats 3 da fase
var avisou: bool = false #serve pra mostrar o aviso de não achei o player só uma vez como se fosse uma flag

func _ready() -> void:
	metronome = _achar_metronomo() # tenta encontrar o AudioStreamPlayer da fase
	pointer.position.x = start_marker.position.x # marca a posição de começo na marcação na ponta esquerda



func _process(_delta: float) -> void:
	if metronome == null:
		metronome = _achar_metronomo()
		if metronome == null:
			if not avisou:
				avisou = true
				push_warning("nenhum AudioStreamPlayer encontrado com o script da fase")
			return

	if not metronome.playing:
		return

	if alvos.is_empty():
		_montar_alvos()
		if alvos.is_empty():
			return

	if meia_janela_safe <= 0.0:
		return

	var song_pos: float = metronome.song_position
	var alvo: float = _alvo_mais_proximo(song_pos)
	var d: float = song_pos - alvo # negativo = antes do alvo, positivo = depois
	var ant: float = maxf(antecedencia, meia_janela_safe + 0.01)

	var x: float
	if d < -meia_janela_safe: # antes de começar a parte verde
		var prog: float = clampf(inverse_lerp(-ant, -meia_janela_safe, d), 0.0, 1.0)
		x = lerpf(start_marker.position.x, safe_start_marker.position.x, prog)
	elif d <= meia_janela_safe: # dentro da parte verde
		var prog: float = inverse_lerp(-meia_janela_safe, meia_janela_safe, d)
		x = lerpf(safe_start_marker.position.x, safe_end_marker.position.x, prog)
	else: # depois de sair da parte verde
		var prog: float = clampf(inverse_lerp(meia_janela_safe, ant, d), 0.0, 1.0)
		x = lerpf(safe_end_marker.position.x, end_marker.position.x, prog)

	pointer.position.x = x


# Primeiro tenta o caminho do inspetor; se não achar, procura na cena inteira
func _achar_metronomo() -> Node:
	var no: Node = get_node_or_null(metronome_path)
	if no != null:
		return no
	var raiz: Node = get_tree().current_scene
	if raiz == null:
		raiz = get_tree().root
	return _procurar_metronomo(raiz)


# busca pelo AudioStreamPlayer que tenha o script da fase
func _procurar_metronomo(no: Node) -> Node:
	if no is AudioStreamPlayer and "secPerBeat" in no:
		return no
	for filho in no.get_children():
		var achado: Node = _procurar_metronomo(filho)
		if achado != null:
			return achado
	return null


# todo terceiro tempo da tabela é o momento que o jogador precisa apertar pra ganhar o perfect
func _montar_alvos() -> void:
	var spb: float = metronome.secPerBeat
	if spb <= 0.0:
		return
	var tabela: Array = metronome.t
	for i in tabela.size():
		for j in 4:
			if tabela[i][j] == 3:
				alvos.append((i * 4 + j) * spb)


func _alvo_mais_proximo(pos: float) -> float:
	var melhor: float = alvos[0]
	for a in alvos:
		if absf(pos - a) < absf(pos - melhor):
			melhor = a
	return melhor
