extends TextureButton


func _on_button_down() -> void:
	$AudioStreamPlayer.play()
	await $AudioStreamPlayer.finished
	$AudioStreamPlayer.stop()
	


func _on_mouse_entered() -> void:
	scale += Vector2(0.2,0.2)


func _on_mouse_exited() -> void:
	scale -= Vector2(0.2,0.2)
