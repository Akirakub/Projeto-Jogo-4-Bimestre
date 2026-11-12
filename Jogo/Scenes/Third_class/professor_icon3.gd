extends TextureRect

var i:int = 0

@export var image: Array[Texture2D] = [
	preload("res://Assets/Sprites/Characters/icon/icon_robo_dano (1).png"),
	preload("res://Assets/Sprites/Characters/icon/icon_robo_normal.png"), 
]

func _ready() -> void:
	pivot_offset = size / 2 
	SinalGlobal.vida_mudou.connect(_on_vida_mudou)
	SinalGlobal.beat.connect(_on_beat)
	show_image()
	
func _on_beat() -> void: 
	var tw = create_tween()
	scale = Vector2(1.15, 1.15) 
	tw.tween_property(self, "scale", Vector2(1, 1), 0.2)
	
func _on_vida_mudou(vida:int) -> void:
	if vida < 4:
		i = 1 # o aluno está mal -> o professor troca de frame
	else:
		i = 0
	show_image()

func show_image() -> void:
	texture = image[i]
