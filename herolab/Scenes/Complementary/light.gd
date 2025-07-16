extends TextureButton

@export var textura_ligada : Texture2D
@export var textura_desligada : Texture2D
var selected = false

func _ready() -> void:
	
	if !texture_normal or texture_normal == textura_ligada:
		texture_normal = textura_desligada



func _on_button_down() -> void:
	
	if texture_normal == textura_desligada:
		texture_normal = textura_ligada
		selected = true
		
	else:
		texture_normal = textura_desligada
		selected = false
		


func select():
	texture_normal = textura_ligada
	selected = true

func deselect():
	texture_normal = textura_desligada
	selected = false
