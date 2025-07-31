extends Control


@onready var progresso_bar = $TextureProgressBar

func _ready() -> void:
	
	progresso_bar.value = progresso_bar.max_value


func _process(delta: float) -> void:
	
	$"7".text = str(int(progresso_bar.value))

func _on_arrow_down_1_button_down() -> void:
	progresso_bar.value -= 1
	play_decrease()

	


func _on_arrow_up_1_button_down() -> void:
	progresso_bar.value += 1
	play_increase()


func _on_arrow_down_2_button_down() -> void:
	progresso_bar.value -= 5
	play_decrease()
	


func _on_arrow_up_2_button_down() -> void:
	progresso_bar.value += 5
	play_increase()
	


func play_increase():
	$IncreaseAudio.play()

func reset():
	progresso_bar.value = progresso_bar.max_value
	
	pass

func play_decrease():
	$DecreaseAudio.play()


func _on_arrow_up_2_mouse_entered() -> void:
	$Button5/ArrowUp2.scale += Vector2(0.2,0.2)


func _on_arrow_down_2_mouse_entered() -> void:
	$Button5/ArrowDown2.scale += Vector2(0.2,0.2)


func _on_arrow_up_1_mouse_entered() -> void:
	$Button1/ArrowUp1.scale += Vector2(0.2,0.2)


func _on_arrow_down_1_mouse_entered() -> void:
	$Button1/ArrowDown1.scale += Vector2(0.2,0.2)


func _on_arrow_down_1_mouse_exited() -> void:
	$Button1/ArrowDown1.scale -= Vector2(0.2,0.2)


func _on_arrow_up_1_mouse_exited() -> void:
	$Button1/ArrowUp1.scale -= Vector2(0.2,0.2)


func _on_arrow_down_2_mouse_exited() -> void:
	$Button5/ArrowDown2.scale -= Vector2(0.2,0.2)

func _on_arrow_up_2_mouse_exited() -> void:
	$Button5/ArrowUp2.scale -= Vector2(0.2,0.2)
