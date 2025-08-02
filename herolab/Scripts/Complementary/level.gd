extends Control


var lights_on = 0

func get_points():
	
	lights_on = 0
	
	for i in $Lights.get_children():
		if i.selected:
			lights_on += 1
	
	return lights_on

func set_points(number):
	
	for i in number:
		var light = $Lights.get_child(i)
		light.select()

func clear_points():
	
	for i in $Lights.get_children():
		i.deselect()
