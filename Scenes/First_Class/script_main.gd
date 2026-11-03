extends Control # O script está em uma label, o que faz com que ele possa ser referido como self
# toda vez que tiver um self é a mesma coisa que Label
@onready var label1 = $Node2D/Label

var random:bool = true
# SE RANDOM = FALSE
var tp:int = 1

var r_x1 = [1,10]
var r_x2 = [1,10]
#region 
var x1: int # Váriavel 1
var x2: int # Váriavel 2

# Exemplo: x1 + x2 ou x1 - x2 ou x2 -x1 ou x1 * x2... 
var semi:bool
var resp:int # Váriavel da resposta
# Exemplo: 15(x1) - 5(x2) = 10(resp)
var simb: String # string de um símbolo de operação, não tem nenhuma função além disso
#Ex: +,-,*,/
var res # Vetor para armazenar o retorno
#Ex: Um retorno pode ser tipo [10,20,30] 
var ress: String # É o vetor convertido para string, vou utilizar ele para pegar o lenght e calcular até quantos inputs são aceitos
var buffer:String = "" # Buffer do teclado, registra o que o player digitar

var respondida:bool = false # Boolean utilizada pra ver se o player já digitou, para evitar que responda duas vezes

signal evento() #dps que o player digita, esse sinal é enviado pra verificar se o tempo que ele acertou está dentro do intervalo permitido
var i:int = 0 
#endregion

func _ready() -> void: # Função principal do código, carregada quando a cena entra
	label1.text = ""
func gerarconta(tipo,menor:bool): # Função gerar conta, ele gera uma conta # Tipo de operação. Ex: Soma, subtração...
	while true:
		x1 = randi_range(r_x1[0],r_x1[1]*2) # Define a váriavel x1, por um valor aleatório, dentro
			# de 0 a 10, tipo {x1 E R|0<=x1<=10}
		x2 = randi_range(r_x2[0],r_x2[1]*2) # D
		
		var x # Variável só pra armazenar um valor na hora de colocar o maior primeiro
		# fiz isso para que todo valor da resposta fosse positivo
		
		#Ex: se x1 for menor x2, tipo 2-3, a resposta vai ser -1
		# trocando as variáveis, fica 3-2, a resposta vai ser 1
		
		if x1<x2:
			x = x1
			x1 = x2
			x2 = x
			
		if tipo == 1 : #caso 0, a conta vai ser uma soma
			resp = x1 + x2
			simb = "+"
		elif tipo == 2: #caso 1, subtração...
			resp = x1 - x2
			simb = "-" 
		elif tipo == 3: #caso 2, multiplicação...
			if menor and x1 * x2 > 9:
				while x1 * x2 > 9:
					x1 -=1
				if x1 * x2 > 9:
						x2 -=1
			resp = x1 * x2
			simb = "x" 
		elif tipo == 4: #caso 3, divisão...
			x = x1*x2
			x1 = x
			simb = "/"
			resp = x1 / x2
			
		if menor and resp < 10:
			return [x1,x2,resp]
		elif menor == false and resp > 9 and resp <20:
			return [x1,x2,resp] 

func _input(event) ->void: # Função que pega todos os inputs
	if event is InputEventKey and event.is_pressed() and not event.is_echo() and not respondida:
		var tecla = OS.get_keycode_string(event.keycode)
		if event.physical_keycode >= KEY_KP_0 and event.physical_keycode <= KEY_KP_9:
			tecla = str(event.physical_keycode - KEY_KP_0)
		if event.keycode in [KEY_SHIFT, KEY_CTRL, KEY_ALT, KEY_META]:
			return
		if tecla.length() != 1:
			return

	# Como eu quero que somente teclas sejam registradas, eu ponho esse if que checa se:
	# O input é uma tecla
	# O input está sendo pressionado
	# E se não é um echo
		buffer += tecla
		var pos = buffer.length() -1
		if buffer[pos] == ress[pos]:			
			evento.emit()
			if buffer.length() == ress.length():
				respondida = true
				buffer = ""
					#evento.emit() # emite o evento q eu ja falei la em cima (ve se o input ta no intervalo certo)
		else:
			#Aqui é a mesma coisa mas caso ele ere.
			#print("Wrong") 
			#label1.text = str(x1,simb,x2,"=",buffer, " ERRADO!") 
			SinalGlobal.jogador_errou.emit()
			#repare q aq eu nem coloquei esse evento.emit, pq nao tem nem pq verificar se ta dentro do limite se a resposta em si
			# do player ja ta errada
			respondida = true
			buffer ="" # No final de tudo limpa o buffer permitindo que a próxima operação 
				# seja respondida corretamente
func _on_audio_stream_player_tempo(menor:bool) -> void: # Quando o signal do outro script 1stclass for acionado
	if not is_node_ready():
		await ready
	if menor:
		res = gerarconta(randi_range(1,4),true)
		x1 = res[0] # Associa a variável x1 com a posição 0 do vetor
		x2 = res[1] # Associa a variável xx com a posição 1 do vetor
		resp = res[2] # Associa a variável da resposta com a posição 3 do vetor
		ress = str(resp)
		buffer =""
	else:
		res = gerarconta(randi_range(1,4),false)
		x1 = res[0] # Associa a variável x1 com a posição 0 do vetor
		x2 = res[1] # Associa a variável xx com a posição 1 do vetor
		resp = res[2] # Associa a variável da resposta com a posição 3 do vetor
		ress = str(resp)
		
	label1.text = str(x1,simb,x2 ,"=") # Muda o texto da tela para o da operação, permitindo
	# que o player veja a operação e responda
	#print(buffer) #Printa Buffer, só por questões de debug:
	if respondida == false: # Se o tempo for esgotado quando a operação muda e o player não tiver
		if i>=1:	
			# digitado, a operação vai dar como errado
			#print("errou, tempo esgotado") #debug
			SinalGlobal.jogador_errou.emit()
				#!
	i = i + 1
	respondida = false # Torna a boolean como falsa, permitindo registrar uma nova resposta para uma
