#Mãe, deixa eu codar só mais um código, o código:

extends AudioStreamPlayer

var bpm:float = 130


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
var t: Array[Array] = [ 
	[1, 0, 0, 0] as Array[int], # (1) (Cada elemento dentro de um tempo é um beat )
	[3, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[2, 0, 0, 0] as Array[int], # Toda a composição é uma matriz, que dentro dela tem vários tempos (do mesmo tempo)
	[3, 3, 0, 0] as Array[int], # Cada elemento dentro de um tempo é um beat
	[1, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[3, 0, 0, 0] as Array[int], # Toda a composição é uma matriz, que dentro dela tem vários tempos (do mesmo tempo)
	[1, 0, 0, 0] as Array[int], # Cada elemento dentro de um tempo é um beat
	[3, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[1, 0, 0, 0] as Array[int], # (5) Cada elemento dentro de um tempo é um beat
	[3, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[2, 0, 0, 0] as Array[int], # Toda a composição é uma matriz, que dentro dela tem vários tempos (do mesmo tempo)
	[3, 3, 0, 0] as Array[int], # Cada elemento dentro de um tempo é um beat
	[1, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[3, 0, 0, 0] as Array[int], # Toda a composição é uma matriz, que dentro dela tem vários tempos (do mesmo tempo)
	[1, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[3, 0, 0, 0] as Array[int], # Toda a composição é uma matriz, que dentro dela tem vários tempos (do mesmo tempo)
	[1, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[3, 0, 0, 0] as Array[int], # Toda a composição é uma matriz, que dentro dela tem vários tempos (do mesmo tempo)
	[2, 0, 0, 0] as Array[int], # (10)Cada tempo (4/4) é uma matriz
	[3, 3, 0, 0] as Array[int], # Toda a composição é uma matriz, que dentro dela tem vários tempos (do mesmo tempo)
	[1, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[3, 0, 0, 0] as Array[int], # Toda a composição é uma matriz, que dentro dela tem vários tempos (do mesmo tempo)
	[1, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[3, 0, 0, 0] as Array[int], # Toda a composição é uma matriz, que dentro dela tem vários tempos (do mesmo tempo)
	[1, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[3, 0, 0, 0] as Array[int], # Toda a composição é uma matriz, que dentro dela tem vários tempos (do mesmo tempo)
	[1, 0, 0, 0] as Array[int], # Cada elemento dentro de um tempo é um beat
	[3, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[1, 0, 0, 0] as Array[int], # (15)Cada elemento dentro de um tempo é um beat
	[3, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[1, 0, 0, 0] as Array[int], # Cada elemento dentro de um tempo é um beat
	[3, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[1, 0, 0, 0] as Array[int], # Cada elemento dentro de um tempo é um beat
	[3, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[1, 0, 0, 0] as Array[int], # Cada elemento dentro de um tempo é um beat
	[3, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[1, 0, 0, 0] as Array[int], # Cada elemento dentro de um tempo é um beat
	[3, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[1, 0, 0, 0] as Array[int], # (20)Cada elemento dentro de um tempo é um beat
	[3, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[1, 0, 0, 0] as Array[int], # Cada elemento dentro de um tempo é um beat
	[3, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[1, 0, 0, 0] as Array[int], # Cada elemento dentro de um tempo é um beat
	[3, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[1, 0, 0, 0] as Array[int], # Cada elemento dentro de um tempo é um beat
	[3, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[1, 0, 0, 0] as Array[int], # Cada elemento dentro de um tempo é um beat
	[3, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[1, 0, 0, 0] as Array[int], # (25)Cada elemento dentro de um tempo é um beat
	[3, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[1, 0, 0, 0] as Array[int], # Cada elemento dentro de um tempo é um beat
	[3, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[1, 0, 0, 0] as Array[int], # Cada elemento dentro de um tempo é um beat
	[3, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[1, 0, 0, 0] as Array[int], # (29)Cada elemento dentro de um tempo é um beat
	[3, 0, 0, 0] as Array[int], # Cada tempo (4/4) é uma matriz
	[0, 0, 0, -1] as Array[int], # Cada tempo (4/4) é uma matriz
	
	
	
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
		
func _ready() -> void:
	
	play() # toca a musica
	secPerBeat = 60 / bpm # calculo do sec per beat
		 # se a musica estiver tocando
	for i in range(t.size()): # em um período de todos os tempos que tem na música (tipo, cada matriz com 4 elementos no caso)
		for j in range(4): # em um período de 4 (número de beats) --- aq vc pode ver q ele vai acessando mais profundamente a matriz
			# que nem aqueles exercícios da miyuki de sort, pesquisa e tals,que inclusive me inspirei parte nesses exercícios
				if distancia2 > 20 or distancia > 20:
					print('linguiça')
					print(i,j)
					print(distancia)
				if t[i][j] == 0 : # se o elemento for um zero, no caso zero seria nada
					if get_tree():
						await get_tree().create_timer(secPerBeat).timeout
					#permitindo que essa leitura seja conforme o tempo da música
				elif t[i][j] == -1 : # agora se for um 1, no caso uma geração de conta
					print('fim')
					SinalGlobal.win.emit()
					SinalGlobal.p1 = p
					SinalGlobal.g1 = g
					SinalGlobal.m1 = m
					SinalGlobal.w1 = w
					if get_tree():
						await get_tree().create_timer(secPerBeat).timeout
						var arvore = get_tree()
						if arvore:
							arvore.change_scene_to_file("res://Scenes/Menu_Scenes/Win.tscn")
				elif t[i][j] == 1 : # agora se for um 1, no caso uma geração de conta
					proximo(i,j)
					ipts = 0
					
					respondida = false
					tempo.emit(true)
					if get_tree():
						await get_tree().create_timer(secPerBeat).timeout
				elif t[i][j] == 2 : # agora se for um 1, no caso uma geração de conta
					proximo(i,j)
					ipts = 0
					respondida = false
					respondida2 = false
					tempo.emit(false) # emite um sinal pra gerar a conta		
					if get_tree():
						await get_tree().create_timer(secPerBeat).timeout
					
				elif t[i][j] == 3 : #esse 2 ta só p contar o beat, pq a função dele msm é só quando tem um 1 antes, mas dps disso ele so vai
					if get_tree():
						await get_tree().create_timer(secPerBeat).timeout
				else: # coloquei so por precauçao p caso alguem insira algo q não é p ter, ele só ignora e conta mais um tempo
					if get_tree():
						await get_tree().create_timer(secPerBeat).timeout
					
func _on_control_evento() -> void:
		print(ipts)
		if ipts == 0 and respondida == false:
			input_position = song_position #marca o input position como song_position daquele momento
			if distancia < 0.25: # acho q aq nao tem nem mt o que comentar, mas se tiver dentro de alguns limites ele vai marcar, perfect, great e tals
				print("perfect", )
				SinalGlobal.jogador_acertou.emit() # emite sinal de q acertou pro script vida, ai mesma coisa aconte pros outros 2 de resposta "certa"
				p +=1
			elif distancia < 0.5:
				print('great')
				g +=1
				SinalGlobal.jogador_acertou.emit()
			elif distancia < 1:
						print('meh ', distancia,' ', song_position_in_beats,'BBB')
						m +=1
			elif distancia > 1:
						print('wrong', distancia,' ', song_position_in_beats,'BBB')
						SinalGlobal.jogador_errou.emit() # agora se o input do player for fora do intervalo, vai marcar como errado
						w +=1
			respondida = true
			ipts += 1
		elif ipts == 1 and respondida2 == false:
			input_position = song_position #marca o input position como song_position daquele momento
			if distancia2 < 0.25: # acho q aq nao tem nem mt o que comentar, mas se tiver dentro de alguns limites ele vai marcar, perfect, great e tals
				print("perfect", 'AAA' )
				SinalGlobal.jogador_acertou.emit() # emite sinal de q acertou pro script vida, ai mesma coisa aconte pros outros 2 de resposta "certa"
				p +=1
			elif distancia2 < 0.5:
				print('great AAA' )
				g +=1
				SinalGlobal.jogador_acertou.emit()
			elif distancia2 < 1:
						print('meh ', distancia2,' ', song_position_in_beats,'AAA')
						m +=1
			elif distancia2 > 1:
						print('wrong', distancia2,' ', song_position_in_beats,'AAA')
						SinalGlobal.jogador_errou.emit() # agora se o input do player for fora do intervalo, vai marcar como errado
						w +=1
			respondida = true
			ipts += 1
		else:
			print('4', ipts,respondida,respondida2)
