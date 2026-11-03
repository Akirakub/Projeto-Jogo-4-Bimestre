extends Control

@onready var sfx_button: AudioStreamPlayer = $sfx_button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Hello,world!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_button_play_pressed() -> void:
	sfx_button.play()
	get_tree().change_scene_to_file("res://Scenes/Menu_Scenes/Select_Menu.tscn")


func _on_button_credits_pressed() -> void:
	sfx_button.play()
	get_tree().change_scene_to_file("res://Scenes/Menu_Scenes/Credits_Menu.tscn")


func _on_button_exit_game_pressed() -> void:
	sfx_button.play()
	get_tree().quit()


func _on_button_options_pressed() -> void:
	sfx_button.play()
	get_tree().change_scene_to_file("res://Scenes/Menu_Scenes/Options_Menu.tscn")
