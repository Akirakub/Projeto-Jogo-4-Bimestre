extends TextureRect
# varivel pra contar o indice do array e trocar a foto
var i:int=0
#array de armazenar as fotos da cutscene
@export var image: Array[Texture2D]=[ 
	preload("res://Assets/Scenery/sc1.png"), 
	preload("res://Assets/Scenery/sc2.png"),   
	preload("res://Assets/Sprites/Random/Números/Oito.png")    
]						
# Mostra a imagem 
func _ready() -> void:
	show_image()

#meio que quando o indice mudar ele vai tranferir a foto pro texture que e uma variavel do proprio godot pra exibir a foto
func show_image() -> void:
	texture=image[i]
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

#funcao pra passar as imagens e quando acabar as imagens ele manda pra fase principal
func _on_button_pressed() -> void:
	if	i<1:
		i+=1
		show_image()
	else:
		get_tree().change_scene_to_file("res://Scenes/First_Class/First_Classl.tscn")
		
