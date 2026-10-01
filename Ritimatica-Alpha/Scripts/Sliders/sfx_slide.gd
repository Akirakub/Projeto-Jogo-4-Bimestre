extends HSlider

#esse export e essa variavel faz com que o slider saiba qual bus(qual canal) ele esta pegando pelo indice dele
@export var bus_SFX: String 
#essa variavel pega o indice pra ela 
var bus_index:int

func _ready() -> void:
	#essa funcao pega o indice e passa pra variavel bus index
	bus_index = AudioServer.get_bus_index(bus_SFX)
	#seria como quando esse sinal for emitido o que esta dentros dos parenteses excecuta
	#ou seja essa funcao faz com que eu consiga sincronizar o slide com o volume
	value_changed.connect(_on_value_changed)
	
	#funcao que e feita depois da de baixo
	#ela cata o valores em decibeis e faz em linear pra o slide reconhecer
	value = db_to_linear(
		AudioServer.get_bus_volume_db(bus_index)
	)
#tranforma os dados lineares de som para decibeis, meio que isso que vai fazer com que 
#eu consiga controlar o som em decibeis mas passar pra o slider denovo em dados lineares que no caso e a funcao acima
#que refaz os dados entao linear->dcibeis->linear e assim mandado pro slide e mudando o som
func _on_value_changed(value:float) -> void:
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(value)
	)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
