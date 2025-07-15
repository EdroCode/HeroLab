extends Control


func _physics_process(delta: float) -> void:
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		$AudioStreamPlayer.play()

		




# Save

func count_stars():
	
	var stars = 0
	
	for i in $UpperBar/StarBar/VBoxContainer.get_children():
		if i.selected:
			stars += 1
	
	return stars

func count_luck():
	
	var luck = 0
	
	for i in $UpperBar/TrevoBar/VBoxContainer.get_children():
		if i.selected:
			luck += 1
	
	return luck

func count_hearts():
	
	var hearts = 0
	
	for i in $SidePanel/Hearts/HBoxContainer.get_children():
		if i.selected:
			hearts += 1
	
	return hearts

# Load

func set_stars(number):
	
	for i in number:
		var star = $UpperBar/StarBar/VBoxContainer.get_child(i)
		star.select()

func set_luck(number):
	for i in number:
		i += 1
		var trevo = $UpperBar/TrevoBar/VBoxContainer.get_child(-i)
		trevo.select()
