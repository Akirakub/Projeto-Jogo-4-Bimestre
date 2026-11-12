extends CanvasLayer

func _ready() -> void:
	visible = false 
	get_tree().paused = false
	process_mode = Node.PROCESS_MODE_ALWAYS

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if get_tree().paused:
			_resume_game()
		else:
			_pause_game()

func _pause_game() -> void:
	visible = true
	get_tree().paused = true
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false) # (opcional)

func _resume_game() -> void:
	visible = false
	get_tree().paused = false

func _on_button_pressed() -> void:
	_resume_game()

func _on_main_menu_pressed() -> void:
	_resume_game()
	get_tree().change_scene_to_file("res://Scenes/Menu_Scenes/Main_Menu.tscn")

func _on_end_pressed() -> void:
	get_tree().quit()
