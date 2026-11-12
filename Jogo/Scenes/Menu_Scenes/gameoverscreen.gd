extends Sprite2D

func _input(event):
	if event is InputEventMouseButton and event.button_index == Re and event.pressed:
		# Este código é executado quando o botão esquerdo do mouse é clicado
		# Substitua a próxima linha pela lógica de mudança de cena que você precisa
		get_tree().change_scene("res://path_to_your_next_scene.tscn")
