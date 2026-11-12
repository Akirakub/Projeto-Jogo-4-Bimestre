#Mãe, deixa eu codar só mais um código, o código:

extends AudioStreamPlayer

var bpm:float = 130

@onready var fala = $%Fala 
@onready var combo_label = $%Combo
var som_acerto := AudioStreamPlayer.new() 
var som_erro := AudioStreamPlayer.new() 
var combo: int=0
var combo_max: int = 0
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
var t: Array[Array] = [ 
	[1, 0, 0, 0] as Array[int], # (1) (Cada elemento dentro de um tempo é um beat )
	[3, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[2, 0, 0, 0] as Array[int], # Toda a composição é uma matriz, que dentro dela tem vários tempos (do mesmo tempo)
	[3, 3, 0, 0] as Array[int], # Cada elemento dentro de um tempo é um beat
	[1, 0, 0, 0] as Array[int],
	[3, 0, 0, 0] as Array[int],
	[1, 0, 0, 0] as Array[int],
	[3, 0, 0, 0] as Array[int],
	[1, 0, 0, 0] as Array[int], # (5)
	[3, 0, 0, 0] as Array[int],
	[2, 0, 0, 0] as Array[int],
	[3, 3, 0, 0] as Array[int],
	[1, 0, 0, 0] as Array[int],
	[3, 0, 0, 0] as Array[int],
	[1, 0, 0, 0] as Array[int],
	[3, 0, 0, 0] as Array[int],
	[1, 0, 0, 0] as Array[int],
	[3, 0, 0, 0] as Array[int],
	[2, 0, 0, 0] as Array[int], # (10)
	[3, 3, 0, 0] as Array[int],
	[1, 0, 0, 0] as Array[int],
	[3, 0, 0, 0] as Array[int],
	[1, 0, 0, 0] as Array[int],
	[3, 0, 0, 0] as Array[int],
	[2, 0, 0, 0] as Array[int],
	[3, 3, 0, 0] as Array[int],
	[1, 0, 0, 0] as Array[int],
	[3, 0, 0, 0] as Array[int],
	[1, 0, 0, 0] as Array[int], # (15)
	[3, 0, 0, 0] as Array[int],
	[1, 0, 0, 0] as Array[int],
	[3, 0, 0, 0] as Array[int],
	[1, 0, 0, 0] as Array[int],
	[3, 0, 0, 0] as Array[int],
	[2, 0, 0, 0] as Array[int],
	[3, 3, 0, 0] as Array[int],
	[2, 0, 0, 0] as Array[int],
	[3, 3, 0, 0] as Array[int],
	[1, 0, 0, 0] as Array[int], # (20)
	[3, 0, 0, 0] as Array[int],
	[2, 0, 0, 0] as Array[int],
	[3, 3, 0, 0] as Array[int],
	[2, 0, 0, 0] as Array[int],
	[3, 3, 0, 0] as Array[int],
	[1, 0, 0, 0] as Array[int],
	[3, 0, 0, 0] as Array[int],
	[1, 0, 0, 0] as Array[int],
	[3, 0, 0, 0] as Array[int],
	[2, 0, 0, 0] as Array[int], # (25)
	[3, 3, 0, 0] as Array[int],
	[1, 0, 0, 0] as Array[int],
	[3, 0, 0, 0] as Array[int],
	[2, 0, 0, 0] as Array[int],
	[3, 3, 0, 0] as Array[int],
	[1, 0, 0, 0] as Array[int], # (29)
	[3, 0, 0, 0] as Array[int],
	[0, 0, 0, -1] as Array[int],
]
################################################################################
################################################################################
var secPerBeat:float # Segundo por beat
var song_position:float # Posição da musica em segundos ou algo assim (lógica dos caras)
var song_position_in_beats:float # Posição da música em beats
var input_position:float # Aqui é a posição do input do player, quando que ele digitou
var conta_position:float # Aqui é a posição do timing, tem que dar o input o mais perto dela o possível
var conta_position2:float
var ipts: int
var distancia:float # var distancia, usada pra calcular o quão perto foi o input do tempo da conta
var distancia2:float
var respondida:bool
var respondida2:bool
################################################################################
var p:int = 0 #perfects
var g:int = 0 #greats
var m:int = 0 #mehs
var w:int = 0 # wrongs
################################################################################
signal tempo(menor:bool) # sinal pra no outro código gerar uma conta
################################################################################
# Called when the node enters the scene tree for the first time.
var fila:Array = []
var _fala_id: int = 0

func _process(delta) -> void:
	song_position = get_playback_position() + AudioServer.get_time_since_last_mix() ##
	#song_position -= AudioServer.get_output_latency()## Esses três pegam o tempo 
	song_position_in_beats = int(floor(song_position/secPerBeat))## 
	# o intervalo de tempo que é permitido registrar a resposta, quanto menor esse tempo, melhor
	distancia2 = abs(song_position-conta_position2)
	distancia = abs(song_position-conta_position)
	
func proximo(i:int,j:int) -> void:

	var achou = 0 # variavel de pesquisa
	for ii in range(i, t.size()): # um segundo for for que sai adoidado procurando o conta_position mais próximo
		for jj in range(4):
			if ii == i and jj < j:
				continue
			if t[ii][jj] == 3: # 2 = conta_position	
				achou += 1
				if achou == 1: # ele ent marca que encontrou
					conta_position = ((ii * 4) + jj) * secPerBeat # ja define a proxima conta_position com um calculo
				elif achou == 2:
					conta_position2 = ((ii * 4) + jj) * secPerBeat
					return

# <<< 
func _esperar(i:int, j:int) -> void:
	var alvo:float = ((i * 4) + j + 1) * secPerBeat 
	var falta:float = alvo - song_position 
	if get_tree(): 
		await get_tree().create_timer(max(falta, 0.0), false).timeout 
		
func _ready() -> void:
	SinalGlobal.beat.connect(_pulso_combo)
	SinalGlobal.errou_fala.connect(_on_control_errou)
	som_acerto.stream = preload("res://Sounds/SFX/Acerto.mp3") 
	som_acerto.volume_db = -6
	som_erro.stream = preload("res://Sounds/SFX/freesound_community-error-sound-39539.mp3") 
	add_child(som_acerto) 
	add_child(som_erro) 
	play() # toca a musica
	secPerBeat = 60 / bpm # calculo do sec per beat
		 # se a musica estiver tocando
	for i in range(t.size()): # em um período de todos os tempos que tem na música (tipo, cada matriz com 4 elementos no caso)
		for j in range(4): # em um período de 4 (número de beats) --- aq vc pode ver q ele vai acessando mais profundamente a matriz
				SinalGlobal.beat.emit()
			# que nem aqueles exercícios da miyuki de sort, pesquisa e tals,que inclusive me inspirei parte nesses exercícios
				if distancia2 > 20 or distancia > 20:
					print('linguiça')
					print(i,j)
					print(distancia)
				if t[i][j] == 0 : # se o elemento for um zero, no caso zero seria nada
					await _esperar(i,j) 
					#permitindo que essa leitura seja conforme o tempo da música
				elif t[i][j] == -1 : # agora se for um 1, no caso uma geração de conta
					print('fim')
					SinalGlobal.win.emit()
					SinalGlobal.p1 = p
					SinalGlobal.g1 = g
					SinalGlobal.m1 = m
					SinalGlobal.w1 = w
					SinalGlobal.combo_max1 = combo_max
					SinalGlobal.liberar_fase(2)
					if get_tree():
						await get_tree().create_timer(secPerBeat,false).timeout # (igual ao original, não mudou)
						var arvore = get_tree()
						if arvore:
							arvore.change_scene_to_file("res://Scenes/Menu_Scenes/Win.tscn")
				elif t[i][j] == 1 : # agora se for um 1, no caso uma geração de conta
					proximo(i,j)
					ipts = 0
					respondida = false
					respondida2 = false
					tempo.emit(true)
					await _esperar(i,j) #
				elif t[i][j] == 2 : # agora se for um 1, no caso uma geração de conta
					proximo(i,j)
					ipts = 0
					respondida = false
					respondida2 = false
					tempo.emit(false) # emite um sinal pra gerar a conta		
					await _esperar(i,j) 
					
				elif t[i][j] == 3 : #esse 2 ta só p contar o beat, pq a função dele msm é só quando tem um 1 antes, mas dps disso ele so vai
					await _esperar(i,j)
				else: # coloquei so por precauçao p caso alguem insira algo q não é p ter, ele só ignora e conta mais um tempo
					await _esperar(i,j) 
func _perdeu_combo() -> void:
	if combo >= 5: 
		som_erro.play()
		SinalGlobal.treme.emit()
	combo = 0
	_atualiza_combo()

func _mostrar_fala(texto: String, cor: Color) -> void:
	_fala_id += 1
	var meu_id := _fala_id
	fala.text = texto
	fala.modulate = cor # cor do texto
	fala.pivot_offset = fala.size / 2 # escala a partir do centro
	fala.scale = Vector2(1.5, 1.5) # começa grande...
	var tw = create_tween()
	tw.tween_property(fala, "scale", Vector2(1, 1), 0.15) # ...e volta ao normal
	await get_tree().create_timer(1.2).timeout
	if meu_id == _fala_id: # só apaga se ninguém escreveu depois
		fala.text = ""
							
func _on_control_evento() -> void:
		print(ipts)
		if ipts == 0 and respondida == false:
			respondida = true 
			ipts += 1 
			input_position = song_position #marca o input position como song_position daquele momento
			if distancia < 0.10: # acho q aq nao tem nem mt o que comentar, mas se tiver dentro de alguns limites ele vai marcar, perfect, great e tals
				print("perfect", )
				SinalGlobal.jogador_acertou.emit() # emite sinal de q acertou pro script vida, ai mesma coisa aconte pros outros 2 de resposta "certa"
				combo += 1
				_atualiza_combo()
				som_acerto.play()
				p +=1
				_mostrar_fala("PERFEITO", Color(0.786, 0.658, 0.0, 1.0))
			elif distancia < 0.25:
				print('great')
				g +=1
				SinalGlobal.jogador_acertou.emit()
				som_acerto.play()
				combo += 1
				_atualiza_combo()
				_mostrar_fala("BOA", Color(0.0, 0.627, 0.175, 1.0))
			elif distancia < 0.50:
				print('meh ', distancia,' ', song_position_in_beats,'BBB')
				m +=1
				_perdeu_combo()
				_mostrar_fala("MEH kk", Color(0.507, 0.725, 0.915, 1.0))
			else: 
				print('wrong', distancia,' ', song_position_in_beats,'BBB')
				SinalGlobal.jogador_errou.emit() # agora se o input do player for fora do intervalo, vai marcar como errado
				w +=1
				_perdeu_combo()
				_mostrar_fala("ERRADO", Color(1, 0.25, 0.25))
			
		elif ipts == 1 and respondida2 == false:
			respondida2 = true #
			ipts += 1 #
			input_position = song_position #marca o input position como song_position daquele momento
			if distancia2 < 0.20: # acho q aq nao tem nem mt o que comentar, mas se tiver dentro de alguns limites ele vai marcar, perfect, great e tals
				print("perfect", 'AAA' )
				SinalGlobal.jogador_acertou.emit() # emite sinal de q acertou pro script vida, ai mesma coisa aconte pros outros 2 de resposta "certa"
				combo += 1
				_atualiza_combo()
				som_acerto.play()
				p +=1
				_mostrar_fala("PERFEITO", Color(0.786, 0.658, 0.0, 1.0))
			elif distancia2 < 0.30:
				print('great AAA' )
				g +=1
				SinalGlobal.jogador_acertou.emit()
				som_acerto.play()
				combo += 1
				_atualiza_combo()
				_mostrar_fala("BOA", Color(0.0, 0.627, 0.175, 1.0))
			elif distancia2 < 0.70:
				print('meh ', distancia2,' ', song_position_in_beats,'AAA')
				m +=1
				_perdeu_combo()
				_mostrar_fala("MEH kk", Color(0.507, 0.725, 0.915, 1.0))
			else: 
				print('wrong', distancia2,' ', song_position_in_beats,'AAA')
				SinalGlobal.jogador_errou.emit() # agora se o input do player for fora do intervalo, vai marcar como errado
				_perdeu_combo()
				w +=1	
				_mostrar_fala("ERRADO", Color(1, 0.25, 0.25))
		else:
			print('4', ipts,respondida,respondida2)

func _atualiza_combo() -> void:
	combo_max = max(combo_max, combo) 
	if combo >= 2:
		combo_label.text = "x" + str(combo)
		combo_label.pivot_offset = combo_label.size / 2
		combo_label.scale = Vector2(1.3, 1.3 	) 
		create_tween().tween_property(combo_label, "scale", Vector2(1, 1), 0.1)
	else:
		combo_label.text = ""

func _pulso_combo() -> void:
	if combo >= 2:
		combo_label.pivot_offset = combo_label.size / 2
		combo_label.scale = Vector2(1.15, 1.15)
		create_tween().tween_property(combo_label, "scale", Vector2(1, 1), 0.2)

func _on_control_errou() -> void:
	w += 1 # conta como wrong
	_perdeu_combo()
	_mostrar_fala("ERRADO", Color(1, 0.25, 0.25))
