extends Control

@export var textura_ligada : Texture2D
@export var textura_desligada : Texture2D
var selected = false

func _ready() -> void:
	
	if !$TrevoButton.texture_normal:
		$TrevoButton.texture_normal = textura_desligada



func _on_trevo_button_button_down() -> void:
	
	$AudioStreamPlayer.play()
	$AudioStreamPlayer.pitch_scale = randf_range(0.95, 1)
	
	if $TrevoButton.texture_normal == textura_desligada:
		selected = true
		$TrevoButton.texture_normal = textura_ligada
	else:
		$TrevoButton.texture_normal = textura_desligada
		selected = false
	
	await  $AudioStreamPlayer.finished
	$AudioStreamPlayer.stop()


func select():
	$TrevoButton.texture_normal = textura_ligada
	selected = true

func deselect():
	$TrevoButton.texture_normal = textura_desligada
	selected = false
