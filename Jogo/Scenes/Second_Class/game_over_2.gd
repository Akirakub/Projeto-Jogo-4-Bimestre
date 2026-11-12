extends Control

	
var imagemrestartnormal = preload("res://Assets/Sprites/restartbutton.png")
var imagemrestart_hover = preload("res://Assets/Sprites/restartbuttonhover.png")

var imagemmainmenu_normal = preload("res://Assets/Sprites/mainmenubutton.png")
var imagemmainmenu_hover = preload("res://Assets/Sprites/mainmenubuttonhover.png")

var imagemquitgame_normal = preload("res://Assets/Sprites/quitgamebutton.png")
var imagemquitgame_hover = preload("res://Assets/Sprites/quitgamebuttonhover.png")

# Quando o mouse passa em cima do botão
func _on_restartbutton_mouse_entered() -> void:
	$Restartbutton.texture_normal = imagemrestart_hover

# Quando o mouse sai de cima do botão
func _on_restartbutton_mouse_exited() -> void:
	$Restartbutton.texture_normal = imagemrestartnormal
	
	
func _on_restartbutton_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Second_Class/Second_class_playablel.tscn")

func _on_mainmenubutton_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu_Scenes/main_menu.tscn")

func _on_quitgamebutton_pressed() -> void:
	get_tree().quit()


func _on_mainmenubutton_mouse_entered() -> void:
	$Mainmenubutton.texture_normal = imagemmainmenu_hover


func _on_mainmenubutton_mouse_exited() -> void:
	$Mainmenubutton.texture_normal = imagemmainmenu_normal


func _on_quitgamebutton_mouse_entered() -> void:
	$Quitgamebutton.texture_normal = imagemquitgame_hover


func _on_quitgamebutton_mouse_exited() -> void:
	$Quitgamebutton.texture_normal = imagemquitgame_normal
