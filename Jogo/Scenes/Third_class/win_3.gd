
extends Control

@onready var P = $VBoxContainer2/P
@onready var G = $VBoxContainer2/G
@onready var M = $VBoxContainer2/M
@onready var W = $VBoxContainer2/W
@onready var ComboMax = $VBoxContainer2/ComboMax
@onready var Nota = $Grade
@onready var Autoplay = $AudioStreamPlayer2D
@onready var Restart: TextureButton = $Restartbutton
@onready var Menu: TextureButton = $Mainmenubutton


var p = SinalGlobal.p1
var g = SinalGlobal.g1
var m = SinalGlobal.m1
var w = SinalGlobal.w1


func _ready() -> void:

	if not Restart.pressed.is_connected(_on_restartbutton_pressed):
		Restart.pressed.connect(_on_restartbutton_pressed)
	if not Menu.pressed.is_connected(_on_mainmenubutton_pressed):
		Menu.pressed.connect(_on_mainmenubutton_pressed)

	P.text = "Perfects = " + str(p)
	G.text = "Greats = " + str(g)
	M.text = "OK = " + str(m)
	W.text = "Wrongs = " + str(w)

	ComboMax.text = "Combo máx = " + str(SinalGlobal.combo_max1)
	# Calcular precisão e rank
	var precisao_final = _precision()
	var rank_final = _obter_rank(precisao_final, w)
	Nota.text = str(rank_final, " (", snappedf(precisao_final, 0.01), "%)")

	_fade_in_botoes()
	await get_tree().create_timer(1.0).timeout
	if is_instance_valid(Autoplay):
		Autoplay.play()


func _precision() -> float:
	var total = p + g + m + w
	if total == 0:
		return 0.0
	var pontos_obtidos = (p * 1.0) + (g * 0.75) + (m * 0.50) + (w * 0.0)
	var pontos_maximos = total * 1.0
	var precision = (pontos_obtidos / pontos_maximos) * 100.0
	return precision


func _obter_rank(precisao: float, wrongs: int) -> String:
	if precisao >= 100.0 and wrongs == 0:
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


# FADE IN DOS BOTÕES
func _fade_in_botoes() -> void:

	Restart.modulate.a = 0.0
	Menu.modulate.a = 0.0

	Restart.disabled = true
	Menu.disabled = true

	var tween = create_tween()

	tween.set_parallel(true)

	tween.tween_property(Restart, "modulate:a", 1.0, 2.0)
	tween.tween_property(Menu, "modulate:a", 1.0, 2.0)

	await tween.finished

	Restart.disabled = false
	Menu.disabled = false


func _on_mainmenubutton_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu_Scenes/Main_Menu.tscn")


func _on_restartbutton_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Third_class/Third_class_playable.tscn")
