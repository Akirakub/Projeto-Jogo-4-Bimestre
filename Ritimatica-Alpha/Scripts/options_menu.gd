extends Control


func _ready() -> void:
	pass

#botao pressionado entao troca de cena pelo sinal dele pressionado
func _on_button_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu_Scenes/Main_Menu.tscn")

#funcao para se estiver assinalado ele fica em fullscreem senao fica em janela
func _on_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
