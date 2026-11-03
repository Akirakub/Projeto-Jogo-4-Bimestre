extends Control

@onready var label1 = $Label
@onready var label2 = $Label2
@onready var label3 = $Label3
@onready var label4 = $Label4

@onready var resp_label = $Resp

var respondida:bool = false
var buffer:String

var ress: String
var x:=[]
var sb:=[]

signal evento

func _ready() -> void:
	buffer = ""
func gerarnumeros(menor:bool):
	while true:
		sb=[]
		x=[]
		var clone = sb.duplicate(true)
		for i in range(4):
			x.append(randi_range(1,10))
		for i in range(4):
			sb.append(randi_range(0,3))
		for i in range(3):
			if  sb[i] == 0:
				clone.append('+')
			elif  sb[i] == 1:
				clone.append('-')
			elif  sb[i] == 2:
				clone.append('*')
			elif  sb[i] == 3:
				clone.append('/')
		var resp = avaliar(x,clone)
		
		if menor == true:
			if resp != null and resp < 10:
					var texto:= "%d%s%d%s%d%s%d" % [x[0],clone[0],x[1],clone[1],x[2],clone[2],x[3]]
					
					print(texto)
					ress = str(resp)
					print(resp)
					return
		else:
			if resp != null and resp > 10 and resp <100:
					var texto:= "%d%s%d%s%d%s%d" % [x[0],clone[0],x[1],clone[1],x[2],clone[2],x[3]]
					
					print(texto)
					ress = str(resp)
					print(resp)
					return
					
func avaliar(nums: Array, ops: Array):
	var n := nums.duplicate()	
	var o := ops.duplicate()

	# 1º passo: * e /
	var i := 0
	while i < o.size():
		if o[i] == "*":
			n[i] = n[i] * n[i + 1]
		elif o[i] == "/":
			if n[i] % n[i + 1] != 0:
				return null         
			n[i] = n[i] / n[i + 1]
		else:
			i += 1
			continue
		n.remove_at(i + 1)
		o.remove_at(i)

	# 2º passo: + e -
	var total = n[0]
	for j in o.size():
		if o[j] == "+":
			total += n[j + 1]
		else:
			total -= n[j + 1]
			if total < 0:
				return null          
	return total
		
	
func _process(delta: float) -> void:
	pass

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


func _on_audio_stream_player_tempo(menor: bool) -> void:
	if not is_node_ready():
		await ready
	if menor:
		gerarnumeros(true)
		buffer =""
	else:
		gerarnumeros(false)
		buffer =""
	#label1.text = str(x1,simb,x2 ,"=",resp) # Muda o texto da tela para o da operação, permitindo
	# que o player veja a operação e responda
	#print(buffer) #Printa Buffer, só por questões de debug:
	if respondida == false: # Se o tempo for esgotado quando a operação muda e o player não tiver	
			# digitado, a operação vai dar como errado
			#print("errou, tempo esgotado") #debug
			SinalGlobal.jogador_errou.emit()
				#!
	respondida = false # Torna a boolean como falsa, permitindo registrar uma nova resposta para uma # Replace with function body.
