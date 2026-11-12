extends TextureRect

var i:int = 0

@export var image: Array[Texture2D] = [
	preload("res://Assets/Sprites/Characters/icon/frames_90/frames_90/professor_frame2.png"),
	preload("res://Assets/Sprites/Characters/icon/frames_90/frames_90/professor_frame1.png"), 
]

func _ready() -> void:
	SinalGlobal.vida_mudou.connect(_on_vida_mudou)
	show_image()

func _on_vida_mudou(vida:int) -> void:
	if vida < 4:
		i = 1 # o aluno está mal -> o professor troca de frame
	else:
		i = 0
	show_image()

func show_image() -> void:
	texture = image[i]
