extends Label

var x1: int #numero 1 
var x2: int #numero 2
var resp:int #resposta
var simb: String #string com o símbolo da operacao (+,-,*,/)
var res #variável utilizada pra armazenar a matriz com a resolução
var tipo #tipo de operacao 

#OBS: provavelmente vamos trocar isso pq essa line precisa confirmar p enviar a resposta, precisamos que ao digitar a resposta conte AUTOMATICAMENTE
func gerarconta(tipo): # função onde caso o parametro define o tipo de operação(+,-,*,/)
	x1 = randf_range(0, 15.0) # aqui vai selecionar um número de 0 a a 10 aleatoriamente
	x2 = randf_range(0, 15.0) # aq tbm
	
	if tipo == 0 : #caso 0, a conta vai ser uma soma
		resp = x1 + x2
		simb = "+"
	elif tipo == 1: #caso 1, subtração...
		resp = x1 - x2
		simb = "-" 
	return [x1,x2,resp] #retorna matriz

func _ready() -> void:
	res = gerarconta(1)
	x1 = res[0]
	x2 = res[1]
	resp = res[2]
	
	self.text = str(x1,simb,x2,"=",resp) 
	print(x1,simb,x2,resp)
# Called every frame. 'delta' is the elapsed time since the previous frame.
