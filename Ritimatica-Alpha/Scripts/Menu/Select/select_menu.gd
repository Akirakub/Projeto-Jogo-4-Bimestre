extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_button_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menu_Scenes/Main_Menu.tscn")


func _on_button_first_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/cutscene/Cutscene_Fase_1.tscn")
