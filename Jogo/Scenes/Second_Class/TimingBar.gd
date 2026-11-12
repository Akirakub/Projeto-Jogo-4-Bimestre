extends Node2D

@onready var background: Sprite2D = $Background
@onready var pointer: Sprite2D = $Pointer
@onready var start_marker: Marker2D = $StartMarker
@onready var end_marker: Marker2D = $EndMarker
@onready var safe_start_marker: Marker2D = $SafeStartMarker
@onready var safe_end_marker: Marker2D = $SafeEndMarker

@export var metronome_path: NodePath = NodePath("../AudioStreamPlayer") 
var metronome: AudioStreamPlayer

func _ready() -> void:
	if not metronome_path.is_empty():
		metronome = get_node(metronome_path)
	
	if start_marker:
		pointer.position = start_marker.position

func _process(_delta: float) -> void:
	if not metronome or not metronome.playing:
		return
	
	var song_pos = metronome.song_position
	var conta_pos = metronome.conta_position  # Momento exato do Perfect (onde ele cruza o meio da barra)
	var sec_per_beat = metronome.secPerBeat
	
	if sec_per_beat <= 0:
		return

	# Janela total em que a conta fica ativa (ex: 0.5s antes até 0.5s depois)
	var tempo_limite_maximo = 0.5 
	var inicio_janela = conta_pos - tempo_limite_maximo
	var fim_janela = conta_pos + tempo_limite_maximo
	var duracao_total = fim_janela - inicio_janela
	
	# Progresso linear de 0.0 até 1.0 cobrindo a barra INTEIRA durante a janela
	var progresso = (song_pos - inicio_janela) / duracao_total
	progresso = clamp(progresso, 0.0, 1.0)
	
	# Verifica em qual compasso estamos para alternar a direção (Ida em um, Volta no outro)
	var duracao_compasso = sec_per_beat * 4.0
	var indice_compasso = int(floor(song_pos / duracao_compasso))
	
	var fator_movimento = 0.0
	if indice_compasso % 2 == 0:
		# Compasso Par: Vai inteiro da esquerda para a direita (0.0 -> 1.0)
		# Passa exatamente pelo centro (zona verde) bem na hora do conta_pos
		fator_movimento = progresso
	else:
		# Compasso Ímpar: Volta inteiro da direita para a esquerda (1.0 -> 0.0)
		# Passa exatamente pelo centro (zona verde) bem na hora do conta_pos
		fator_movimento = 1.0 - progresso

	# Move o ponteiro percorrendo toda a extensão entre o Start e o End
	pointer.position.x = lerp(start_marker.position.x, end_marker.position.x, fator_movimento)
