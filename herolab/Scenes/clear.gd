extends Button


func _on_button_down() -> void:
	$"../../StatsPanel/NameInput".text = ""
	$"../../StatsPanel/LevelInput".text = "01"
	$"../../Inventory/Money/MoneyInput".text = "000"
	
	for i in $"../../UpperBar/TrevoBar/VBoxContainer".get_children():
		i.deselect()
	
	for i in $"../../UpperBar/StarBar/VBoxContainer".get_children():
		i.deselect()
	
	$"../../CharacterData/Stats/Attack".clear_points()
	$"../../CharacterData/Stats/Defense".clear_points()
	$"../../CharacterData/Stats/HP".clear_points()
	$"../../StatsPanel/Level".clear_points()
