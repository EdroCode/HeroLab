extends TextureButton


@export var textura_ligada : Texture2D
@export var textura_desligada : Texture2D
var selected = false
var mouse_in = false

func _ready() -> void:
	
	if !texture_normal:
		texture_normal = textura_desligada

func _physics_process(delta: float) -> void:
	
	pass




func deselect():
	selected = false
	texture_normal = textura_desligada


func _on_button_down() -> void:
	if texture_normal == textura_desligada:
		texture_normal = textura_ligada
		selected = true
	else:
		texture_normal = textura_desligada
		selected = false


func _on_mouse_entered() -> void:
	scale = Vector2(1.2,1.2)
	mouse_in = true


func _on_mouse_exited() -> void:
	scale = Vector2(1,1)
	mouse_in = false
