extends Control

func clear():
	
	
	# P1
	
	for i in $Player1/Bar/SwordContainer.get_children():
		i.deselect() 
	
	for i in $Player1/Bar/ShieldContainer.get_children():
		i.deselect() 
	$Player1/Control/Switcher.reset()
	$Player1/CharacterPlacer.clear()
	$Player1/HealthBar.reset()
	
	
	# P2
	
	for i in $Player2/Bar/SwordContainer.get_children():
		i.deselect() 
	
	for i in $Player2/Bar/ShieldContainer.get_children():
		i.deselect() 
	$Player2/Control/Switcher.reset()
	$Player2/CharacterPlacer.clear()
	$Player2/HealthBar.reset()
