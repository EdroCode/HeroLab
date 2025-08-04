extends Control

@export var hit_sprite : Texture2D
@export var miss_sprite : Texture2D

@export var green = Color(0.0, 0.587, 0.0)
@export var red = Color(0.735, 0.0, 0.148)
@export var white = Color(1.0, 1.0, 1.0)

@onready var timer = $Timer

var hit = false

func _ready() -> void:
	$Panel/Miss_Hit.visible = false
	pass

func _on_button_search_button_down() -> void:
	var chance = int($Panel/LineEdit.text) #80
	var resultado := randf() * 100  
	
	
	print(resultado)
	if chance:
		$AudioStreamPlayer.play()
		
		if resultado < chance:
			hit = true
			timer.start()
			$AnimationPlayer.play("roll")
			$Panel/Miss_Hit.visible = false
			$Panel/Miss_Hit.texture = hit_sprite
		else:
			hit = false
			timer.start()
			$AnimationPlayer.play("roll")
			$Panel/Miss_Hit.visible = false
			$Panel/Miss_Hit.texture = miss_sprite
			


func _on_timer_timeout() -> void:
	
	$AudioStreamPlayer.stop()
	
	timer.stop()
	$AnimationPlayer.stop()
	
	if hit:
		$Panel/Miss_Hit.visible = true
		
	else:
		$Panel/Miss_Hit.visible = true
