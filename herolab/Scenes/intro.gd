extends Control


func change_scene():
	
	get_tree().change_scene_to_file("res://Scenes/base.tscn")

func _physics_process(delta: float) -> void:
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		change_scene()
