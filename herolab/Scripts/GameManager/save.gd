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



var save_data = null

# Path - Selected Directory

func create_save_file(path):
	
	var file_path = path + "/" + save_data["name"] + ".save"
	var file = FileAccess.open(file_path, FileAccess.WRITE)
	
	if file:
		file.store_string(JSON.stringify(save_data))
		file.close()
		print("Game File saved to: ", path)
	else:
		print("Failed to save game file.")

func create_save_folder(path):
	
	# Creates folder
	var folder_path = path + "/" + save_data["name"] + "_save"
	
	var error = DirAccess.make_dir_recursive_absolute(folder_path)
	if error != OK:
		print("Folder could not be created")
		return null
	else:
		print("Folder Created in " + folder_path)
		return folder_path




func save_game(dir):
	
	var folder_path = create_save_folder(dir)
	create_save_file(folder_path)







func _on_button_down() -> void:
	$"../../SaveDialog".popup()


func _on_file_dialog_dir_selected(dir: String) -> void:
	print("Selected directory: ", dir)
	save_data = save()  
	save_game(dir)
