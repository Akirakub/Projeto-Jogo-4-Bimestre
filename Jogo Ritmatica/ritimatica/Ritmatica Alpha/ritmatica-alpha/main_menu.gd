extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_button_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Select_Menu.tscn")


func _on_button_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Credits_Menu.tscn")


func _on_button_exit_game_pressed() -> void:
	get_tree().quit()
