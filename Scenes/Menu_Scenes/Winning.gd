extends Control

@onready var P = $VBoxContainer2/P
@onready var G = $VBoxContainer2/G
@onready var M = $VBoxContainer2/M
@onready var W = $VBoxContainer2/W
@onready var Nota = $Grade

var p = SinalGlobal.p1
var g = SinalGlobal.g1
var m = SinalGlobal.m1
var w = SinalGlobal.w1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#######################################
	P.text=str("Perfects = ", SinalGlobal.p1)
	G.text=str("Greats = ", SinalGlobal.g1)
	M.text=str("OK = ", SinalGlobal.m1)
	W.text=str("Wrongs = ", SinalGlobal.w1)
	########################################
	
	var precisao_final = _precision()
	var rank_final = _obter_rank(precisao_final,w)
	
	Nota.text = str( rank_final, "(", snappedf(precisao_final, 0.01), "%)")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _precision() -> float:
	var total = p+g+m+w
	
	var pontos_obtidos = (p * 1.0) + (g * 0.75) + (m * 0.50) + (w * 0.0)
	
	var pontos_maximos = total* 1.0
	
	
	var precision = (pontos_obtidos / pontos_maximos) * 100.0
	
	return precision 
	
func _obter_rank(precisao: float, wrongs: int) -> String:
	if precisao >= 100.0 and wrongs== 0:
		return "SS"
	elif precisao >= 95.0 and wrongs == 0:
		return "S"
	elif precisao >= 90.0:
		return "A"
	elif precisao >= 80.0:
		return "B"
	elif precisao >= 70.0:
		return "C"
	else:
		return "D"	


func _process(delta: float) -> void:
	pass

func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/First_Class/First_Classl.tscn")


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu_Scenes/Main_Menu.tscn")
