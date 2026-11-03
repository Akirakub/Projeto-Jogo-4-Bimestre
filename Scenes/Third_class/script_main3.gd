extends Control

@onready var label = $Label
# Called when the node enters the scene tree for the first time.

var s
var d:=[]
var ress:String

signal evento

var respondida:bool = false
var buffer:String

func _ready() -> void:
	buffer = ""
	
func gerarseq(menor):
	while true:
		d = []
		s = randi_range(1,10)
		var t = 0
		t = randi_range(1,4)
		
		if t == 1:
			var x = 0
			for i in range(4):
				x += s
				d.append(x)
		elif t == 2:
			var x = s * 4	
			var y = 0
			for i in range(4):
				y += s
				d.append(x-y)
		elif t == 3:
			var x = s ** 3
			for i in range(4):
				x /= s
				d.append(x)
		elif t == 4:
			for i in range(4):
				d.append(i*s)
		
		var clone:= d.duplicate(true)
		if menor == true:
			var pq = 0
			for i in range(4):
				if d[i] < 10:
					pq +=1 
			if pq == 0: 
				continue	
			else:
				while true:
					var rand = randi_range(0,3)
					if d[rand] < 10:
						clone[rand] = '?'
						ress = str(d[rand]) 
						label.text = str(clone)
						print(ress)	
						return
				return
		else:
			var pq = 0
			for i in range(4):
				if d[i] > 10:
					pq +=1 
			if pq == 0: 
				continue
			else:		
				while true:
					var rand = randi_range(0,3)
					if d[rand] >= 10 and d[rand] < 100:
						clone[rand] = '?'
						ress = str(d[rand])
						label.text = str(clone)
						return
				return
		
func _input(event) ->void: # Função que pega todos os inputs
	if event is InputEventKey and event.is_pressed() and not event.is_echo() and not respondida:
		var tecla = OS.get_keycode_string(event.keycode)
		if event.physical_keycode >= KEY_KP_0 and event.physical_keycode <= KEY_KP_9:
			tecla = str(event.physical_keycode - KEY_KP_0)
		if event.keycode in [KEY_SHIFT, KEY_CTRL, KEY_ALT, KEY_META]:
			return
		if tecla.length() != 1:
			return
		
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
			print("Wrong") 
			#label1.text = str(x1,simb,x2,"=",buffer, " ERRADO!") 
			SinalGlobal.jogador_errou.emit()
			#repare q aq eu nem coloquei esse evento.emit, pq nao tem nem pq verificar se ta dentro do limite se a resposta em si
			# do player ja ta errada
			respondida = true
			buffer ="" # No final de tudo limpa o buffer permitindo que a próxima operação 
				# seja respondida corretamente

func _process(delta: float) -> void:
	pass

func _on_audio_stream_player_tempo(menor: bool) -> void:
	if not is_node_ready():
		await ready
	if menor:
		gerarseq(true)
		buffer =""
	else:
		gerarseq(false)
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
