extends Control

@export var blank = Texture2D
@export var add = Texture2D

var mouse_in = false

func _ready() -> void:
	
	random_pokemon()
	pass

func _on_sprite_pressed() -> void:
	load_image()

func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Click"):
		if mouse_in:
			load_image()


func load_image():
	$AudioStreamPlayer.play()
	$FileDialog.popup()


func _on_file_dialog_file_selected(path: String) -> void:
	var image = Image.new()
	image.load(path)
	
	var image_texture = ImageTexture.new()
	image_texture.set_image(image)
	
	$ItemSprite.texture = image_texture
	await  $AudioStreamPlayer.finished
	$AudioStreamPlayer.stop()


func _on_item_sprite_mouse_entered() -> void:
	$Sprite.texture_normal = add
	mouse_in = true


func _on_item_sprite_mouse_exited() -> void:
	$Sprite.texture_normal = blank
	mouse_in = false

var short_pokemon_names = [
	"Ekans",
	"Onix",
	"Zubat",
	"Ditto",
	"Mew",
	"Eevee",
	"Snivy",
	"Axew",
	"Jynx",
	"Abra",
	"Luxio",
	"Ralts",
	"Froak",
	"Lapra",
	"Gloom",
	"Gible",
	"Drilb",
	"Litle",
	"Spirt",
	"Drudd",
	"Rogge",
	"Mew",
	"Ditto",
	"Onix",
	"Ekans",
	"Abra",
	"Zubat",
	"Eevee",
	"Snivy",
	"Axew",
	"Jynx",
	"Luxio",
	"Ralts",
	"Drilb",
	"Gible",
	"Lapra",
	"Gloom",
	"Spirt",
	"Litle",
	"Rogge",
	"Drudd",
	"Pikachu",
	"Oddish",
	"Cleffa",
	"Wooper",
	"Taillow",
	"Slugma",
	"Feebas",
	"Trapinch",
	"Togepi",
	"Magby",
	"Swirlix",
	"Natu",
	"Kirlia",
	"Combee",
	"Luvdisc",
	"Tynamo",
	"Munna",
	"Finneon",
	"Buneary",
	"Yungoos",
	"Cutiefly",
	"Wynaut",
	"Beldum"
]


func random_pokemon():
	
	var i = randi_range(0, len(short_pokemon_names) - 1)
	var poke_name = str(short_pokemon_names[i])
	$NameInput.placeholder_text = poke_name

func clear():
	
	$NameInput.text = ""
	random_pokemon()
	$ItemSprite.texture = null
	
	
