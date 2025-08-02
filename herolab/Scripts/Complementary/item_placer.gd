extends Control

@export var blank : Texture2D
@export var add : Texture2D
@export var blank_special : Texture2D
@export var add_special : Texture2D
@export var special := false 
@export var item := true
@export var abacamon := false


func _ready() -> void:
	if item:
		$ItemSprite.add_to_group("Item")
	
	if abacamon:
		$ItemSprite.add_to_group("Abacamon")
	
	if special:
		add = add_special
		blank = blank_special
	$Sprite.texture_normal = blank

func _on_sprite_mouse_entered() -> void:
	$Sprite.texture_normal = add

func _on_sprite_mouse_exited() -> void:
	$Sprite.texture_normal = blank

func _on_sprite_pressed() -> void:
	#get_parent().get_parent().get_node("FileDialog").popup()
	$FileDialog.popup()
	



func _on_file_dialog_file_selected(path: String) -> void:
	
	var image = Image.new()
	image.load(path)
	
	var image_texture = ImageTexture.new()
	image_texture.set_image(image)
	
	$ItemSprite.texture = image_texture
	
	await  $AudioStreamPlayer.finished
	$AudioStreamPlayer.stop()
