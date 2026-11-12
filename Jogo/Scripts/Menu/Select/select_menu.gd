extends Control

@export var botao_segunda: Button
@export var botao_terceira: Button
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	botao_segunda.disabled = SinalGlobal.fases_liberadas < 2
	botao_terceira.disabled = SinalGlobal.fases_liberadas < 3


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_button_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu_Scenes/Main_Menu.tscn")


func _on_button_first_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Cutscene_Fase_1.tscn")


func _on_button_second_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/cutscene/Cutscene2.tscn")


func _on_button_third_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/cutscene/Cutscene3.tscn")
