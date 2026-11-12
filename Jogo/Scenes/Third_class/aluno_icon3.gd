extends TextureRect
# varivel pra contar o indice do array e trocar a foto
var i:int=0

#array de aarmazenar as fotos do icon
@export var image: Array[Texture2D]=[ 
	preload("res://Assets/Sprites/Characters/icon/frames_90/frames_90/aluno_frame3.png"),  
	preload("res://Assets/Sprites/Characters/icon/frames_90/frames_90/aluno_frame2.png"), 
	
]						
# Mostra a imagem 
func _ready() -> void:
	pivot_offset = size / 2 
	SinalGlobal.vida_mudou.connect(_on_vida_mudou) 
	SinalGlobal.beat.connect(_on_beat)
	show_image()
	
func _on_beat() -> void: 
	var tw = create_tween()
	scale = Vector2(1.15, 1.15) 
	tw.tween_property(self, "scale", Vector2(1, 1), 0.2)
	
# <- NOVA: troca o frame conforme a vida
func _on_vida_mudou(vida:int) -> void:
	if vida < 4:
		i = 1 
	else:
		i = 0 
	show_image()
	
	
#meio que quando o indice mudar ele vai tranferir a foto pro texture que e uma variavel do proprio godot pra exibir a foto
func show_image() -> void:
	texture=image[i]
	
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
