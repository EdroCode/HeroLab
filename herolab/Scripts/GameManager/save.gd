extends Button


func _on_mouse_entered() -> void:
	size += Vector2(4,4)


func _on_mouse_exited() -> void:
	size -= Vector2(4,4)
