extends CanvasLayer
var tempo_decorrido: float = 0.0

var cronometro_ativo: bool = true
@onready var cronometro = $Cronometro

func _process(delta: float) -> void:
	if cronometro_ativo:
		tempo_decorrido += delta
		atualizar_display_tempo()

func atualizar_display_tempo() -> void:
	
	var tempo_total_segundos: int = int(tempo_decorrido)
	
	# Calcula a quantidade de minutos e o resto em segundos
	var minutos: int = tempo_total_segundos / 60
	var segundos: int = tempo_total_segundos % 60
	
	# Formata a string para mostrar 2 dígitos para cada (ex: 02:45)
	cronometro.text = "%02d:%02d" % [minutos, segundos]

# Função para pausar a contagem (use quando o jogador vencer, morrer ou pausar o jogo)
func parar_cronometro() -> void:
	cronometro_ativo = false
