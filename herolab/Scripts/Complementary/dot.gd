extends TextureButton

@export var color : Color

var painted = false


func _on_button_down() -> void:
	
	if !painted:
		modulate = color
	else:
		modulate = Color(1.0, 1.0, 1.0)
	painted = !painted

func paint():
	
	painted = true
	modulate = color

func unpaint():
	
	painted = false
	modulate = Color(1.0, 1.0, 1.0)


func _on_mouse_entered() -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			if !painted:
				modulate = color
			else:
				modulate = Color(1.0, 1.0, 1.0)
			painted = !painted
