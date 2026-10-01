extends TextureRect

var i:int=0
@export var image: Array[Texture2D]=[ 
	preload("res://Assets/Scenery/sc1.png"), 
	preload("res://Assets/Scenery/sc2.png"),  
	preload("res://Assets/Sprites/Random/Números/Sete.png")    
]						
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show_image()


func show_image() -> void:
	texture=image[i]
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if	i<1:
		i+=1
		show_image()
	else:
		get_tree().change_scene_to_file("res://Scenes/First_Class/First_Classl.tscn")
		
