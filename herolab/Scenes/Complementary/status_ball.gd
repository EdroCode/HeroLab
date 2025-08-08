extends TextureButton

@onready var neutro = preload("res://ArtWork/Sprites/Extra/Status/Neutro.png")
@onready var congelado = preload("res://ArtWork/Sprites/Extra/Status/Congelado.png")
@onready var doente = preload("res://ArtWork/Sprites/Extra/Status/Doente.png")
@onready var envenenado = preload("res://ArtWork/Sprites/Extra/Status/Envenenado.png")
@onready var dormindo = preload("res://ArtWork/Sprites/Extra/Status/Dormindo.png")
@onready var paralisado = preload("res://ArtWork/Sprites/Extra/Status/Paralisado.png")
@onready var queimado = preload("res://ArtWork/Sprites/Extra/Status/Queimando.png")
@onready var sangrando = preload("res://ArtWork/Sprites/Extra/Status/Sangrando.png")

@onready var sprites = [neutro, congelado, doente, envenenado, dormindo, paralisado, queimado, sangrando]
var i = 0
var estado : int


func _ready() -> void:
	if estado:
		texture_normal = sprites[estado]
	else:
		texture_normal = neutro
		estado = 0
	


func _on_button_down() -> void:
	i += 1
	if i >= sprites.size():
		i = 0
	texture_normal = sprites[i]
	estado = i


func _on_mouse_entered() -> void:
	scale += Vector2(0.1,0.1)

func _on_mouse_exited() -> void:
	scale -= Vector2(0.1,0.1)

func load_ball(a):
	texture_normal = sprites[a]


func clear():
	texture_normal = sprites[0]
