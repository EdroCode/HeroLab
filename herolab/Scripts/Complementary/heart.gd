extends Control

@export var textura_ligada : Texture2D
@export var textura_desligada : Texture2D
var selected = false

func _ready() -> void:
	
	if !$HeartSprite.texture_normal:
		$HeartSprite.texture_normal = textura_desligada

func _physics_process(delta: float) -> void:
	
	
	if selected:
		$AnimationPlayer.play("Pulse")
	else:
		$AnimationPlayer.stop()
		$AnimationPlayer.play("Idle")

func _on_heart_sprite_button_down() -> void:
	$AudioStreamPlayer.play()
	
	if $HeartSprite.texture_normal == textura_desligada:
		$HeartSprite.texture_normal = textura_ligada
		selected = true
	else:
		$HeartSprite.texture_normal = textura_desligada
		selected = false
	
	await  $AudioStreamPlayer.finished
	$AudioStreamPlayer.stop()
	
