extends Control

var points = 0



func get_points():
	
	points = 0
	
	for i in get_children():
		if i.is_in_group("Dot"):
			if i.painted:
				points += 1

func set_points(number):
	
	for i in number:
		var dot = get_child(i + 1)
		if dot.is_in_group("Dot"):
			dot.paint()
