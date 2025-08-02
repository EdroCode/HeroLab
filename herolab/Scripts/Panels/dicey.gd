extends Control



@export var green = Color(0.0, 0.587, 0.0)
@export var red = Color(0.735, 0.0, 0.148)
@export var white = Color(1.0, 1.0, 1.0)

@onready var hit_text = $Panel/RichTextLabel2
@onready var timer = $Timer

var hit = false

func _ready() -> void:
	
	hit_text.visible = false

func _on_button_search_button_down() -> void:
	var chance = int($Panel/LineEdit.text) #80
	
	var resultado := randf() * 100  
	
	
	print(resultado)
	
	if resultado < chance:
		hit = true
		timer.start()
	else:
		hit = false
		timer.start()


func _on_timer_timeout() -> void:
	hit_text.visible = true
	timer.stop()
	
	if hit:
		hit_text.text = "HIT"
		hit_text.add_theme_color_override("default_color", green)
	else:
		hit_text.text = "MISS"
		hit_text.add_theme_color_override("default_color", red)
