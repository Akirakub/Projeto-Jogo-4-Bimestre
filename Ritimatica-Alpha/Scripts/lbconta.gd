extends Label # O script está em uma label, o que faz com que ele possa ser referido como self
# toda vez que tiver um self é a mesma coisa que Label

# Uma label é literalmente um texto que é mostrado na tela, nesse caso vou utiliza-lá pra mostrar
# a operação

var x1: int # Váriavel 1
var x2: int # Váriavel 2

# Exemplo: x1 + x2 ou x1 - x2 ou x2 -x1 ou x1 * x2... 

var resp:int # Váriavel da resposta

# Exemplo: 15(x1) - 5(x2) = 10(resp)
var simb: String # string de um símbolo de operação, não tem nenhuma função além disso
#Ex: +,-,*,/
var res # Vetor para armazenar o retorno
#Ex: Um retorno pode ser tipo [10,20,30] 
var ress: String # É o vetor convertido para string, vou utilizar ele para pegar o lenght e calcular até quantos inputs são aceitos

var buffer:String = "" # Buffer do teclado, registra o que o player digitar
var respondida:bool = false # Boolean utilizada pra ver se o player já digitou, para evitar que responda duas vezes

#await get_tree().create_timer(t).timeout# Isso daqui eu só deixei aqui pra copiar e colar, já que não é que nem
# na linguagem lua que é só wait()
func _ready() -> void: # Função principal do código, carregada quando a cena entra
	self.text = "" # Muda o texto da label para nada, limpando no caso

func gerarconta(tipo): # Função gerar conta, ele gera uma conta # Tipo de operação. Ex: Soma, subtração...
	x1 = randf_range(1, 5) # Define a váriavel x1, por um valor aleatório, dentro
	# de 0 a 10, tipo {x1 E R|0<=x1<=10}
	x2 = randf_range(1, 5) # Define a váriavel x2, por um valor aleatório, dentro
	# de 0 a 10, tipo {x1 E R|0<=x1<=10}
	
	var x # Variável só pra armazenar um valor na hora de colocar o maior primeiro
	# fiz isso para que todo valor da resposta fosse positivo
	
	#Ex: se x1 for menor x2, tipo 2-3, a resposta vai ser -1
	# trocando as variáveis, fica 3-2, a resposta vai ser 1
	
	if x1<x2:
		x = x1
		x1 = x2
		x2 = x
	
	if tipo == 0 : #caso 0, a conta vai ser uma soma
		resp = x1 + x2
		simb = "+"
	elif tipo == 1: #caso 1, subtração...
		resp = x1 - x2
		simb = "-" 
	elif tipo == 2: #caso 2, multiplicação...
		resp = x1 * x2
		simb = "x" 
	elif tipo == 3: #caso 3, divisão...
		resp = x1 / x2
		simb = "/" 
	return [x1,x2,resp] # Retorna a matriz em formato de vetor

func _input(event) ->void: # Função que pega todos os inputs
	if event is InputEventKey and event.is_pressed() and not event.is_echo() and not respondida:
	# Como eu quero que somente teclas sejam registradas, eu ponho esse if que checa se:
	# O input é uma tecla
	# O input está sendo pressionado
	# E se não é um echo
		buffer += event.as_text_keycode() # Coloca todos os inputs dentro do buffer
		if buffer.length() == str(ress).length(): # Se o buffer atingir o comprimento da string de resposta
				if buffer == ress: # Se o buffer for igual a resposta (se o player acertar a conta)
					print("Right") # vai dar como certa
					respondida = true # respondida vai ser true, não permitindo que ele digite novamente
					self.text = str(x1,simb,x2,"=",ress, " CERTO!") 
				else:
					#Aqui é a mesma coisa mas caso ele ere.
					print("Wrong") 
					self.text = str(x1,simb,x2,"=",buffer, " ERRADO!") 
					respondida = true
				buffer ="" # No final de tudo limpa o buffer permitindo que a próxima operação 
				# seja respondida corretamente
				


func _on_audio_stream_player_tempo() -> void: # Quando o signal do outro script 1stclass for acionado
	
	respondida = false # Torna a boolean como falsa, permitindo registrar uma nova resposta para uma
	# nova operação 
	var tp = randi_range(0,3)
	
	res = gerarconta(tp) # Associa o vetor de armazenamento com o vetor que retorna
	x1 = res[0] # Associa a variável x1 com a posição 0 do vetor
	x2 = res[1] # Associa a variável xx com a posição 1 do vetor
	resp = res[2] # Associa a variável da resposta com a posição 3 do vetor
	ress = str(resp) # Torna a variável da resposta em uma string
	
	self.text = str(x1,simb,x2 ,"=","?") # Muda o texto da tela para o da operação, permitindo
	# que o player veja a operação e responda
	print(buffer) #Printa Buffer, só por questões de debug
	
	if respondida == false: # Se o tempo for esgotado quando a operação muda e o player não tiver
		# digitado, a operação vai dar como errado
		print("errou, tempo esgotadop") #debug
		
	#!
