extends TextureButton

@export var ar = preload("res://ArtWork/Sprites/DuelExpansion/ELEMENTO AR.png")
@export var fogo = preload("res://ArtWork/Sprites/DuelExpansion/ELEMENTO FOGO.png")
@export var lunar = preload("res://ArtWork/Sprites/DuelExpansion/ELEMENTO LUNAR.png")
@export var solar = preload("res://ArtWork/Sprites/DuelExpansion/ELEMENTO SOLAR.png")
@export var terra = preload("res://ArtWork/Sprites/DuelExpansion/ELEMENTO TERRA.png")
@export var agua = preload("res://ArtWork/Sprites/DuelExpansion/ELEMENTO ÁGUA.png")

var sprites = [ar, fogo, lunar, solar, terra, agua]
var i = 0

func _on_button_down() -> void:
	i += 1
	if i >= sprites.size():
		i = 0
	texture_normal = sprites[i]


func _on_mouse_entered() -> void:
	scale += Vector2(0.2,0.2)


func _on_mouse_exited() -> void:
	scale -= Vector2(0.2,0.2)

func reset():
	
	i = 0
	texture_normal = sprites[i]
	
	
