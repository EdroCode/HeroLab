extends Control


@export var items: Array[Texture2D] = []

func _ready() -> void:
	
	shop_mode = false
	visible = false


func reroll_items():
	
	var a
	var b
	var c
	
	a = randi_range(0,19)
	b = randi_range(0,19)
	c = randi_range(0,19)
	
	while a == c or c == b or a == b:
		a = randi_range(0,19)
		b = randi_range(0,19)
		c = randi_range(0,19)
		
	
	$Item1.texture = items[a]
	$Item2.texture = items[b]
	$Item3.texture = items[c]
	

func _on_reload_button_down() -> void:
	reroll_items()

func _physics_process(delta: float) -> void:
	pass

var shop_mode = false
@export var shop_icon : Texture
@export var fight_icon : Texture


func _on_shop_button_button_down() -> void:
	
	shop_mode = !shop_mode
	
	if shop_mode:
		$"../ShopButton".icon = fight_icon
		$".".visible = true
		$"../SidePanel".visible = false
	else:
		$"../ShopButton".icon = shop_icon
		$"../SidePanel".visible = true
		
		$".".visible = false
		
