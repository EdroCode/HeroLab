extends Button

@onready var parent = $"../.."


func _on_mouse_entered() -> void:
	size += Vector2(4,4)


func _on_mouse_exited() -> void:
	size -= Vector2(4,4)




func save():
	
	$"../../CharacterData/Stats/Attack".get_points()
	$"../../CharacterData/Stats/Defense".get_points()
	$"../../CharacterData/Stats/HP".get_points()
	$"../../StatsPanel/Level".get_points()
	
	var save_dict = {
		"filename" : str($"../../StatsPanel/NameInput".text) + "_save",
		"name" : str($"../../StatsPanel/NameInput".text),
		"level" : int($"../../StatsPanel/LevelInput".text),
		"popularity" : parent.count_stars(),
		"luck" : parent.count_luck(),
		"attack_points" : $"../../CharacterData/Stats/Attack".points,
		"def_points" : $"../../CharacterData/Stats/Defense".points,
		"hp_points" : $"../../CharacterData/Stats/HP".points,
		"money" : int($"../../Inventory/Money/MoneyInput".text),
		"level_lights" : int($"../../StatsPanel/Level".lights_on)
		
	}
	#print(save_dict)
	return save_dict

	

func save_game(path):
	
	var save_data = save()  
	var file = FileAccess.open(path, FileAccess.WRITE)
	
	if file:
		file.store_string(JSON.stringify(save_data))
		file.close()
		print("Game saved to: ", path)
	else:
		print("Failed to save game.")






func _on_button_down() -> void:
	$"../../SaveDialog".popup()


func _on_file_dialog_dir_selected(dir: String) -> void:
	print("Selected directory: ", dir)

	var s_name = save()["filename"]
	var save_name = s_name + ".save"
	var full_path = dir.rstrip("/") + "/" + save_name

	save_game(full_path)
