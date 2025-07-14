extends Control

@export var textura_ligada : Texture2D
@export var textura_desligada : Texture2D


func _ready() -> void:
	
	if !$StarButton.texture_normal or $StarButton.texture_normal == textura_ligada:
		$StarButton.texture_normal = textura_desligada


func _on_star_button_down() -> void:
	$AudioStreamPlayer.play()
	$AudioStreamPlayer.pitch_scale = randf_range(0.95, 1)
	
	
	if $StarButton.texture_normal == textura_desligada:
		$StarButton.texture_normal = textura_ligada
	else:
		$StarButton.texture_normal = textura_desligada
		
	await  $AudioStreamPlayer.finished
	$AudioStreamPlayer.stop()
