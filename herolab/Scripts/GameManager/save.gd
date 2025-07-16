extends Button

@onready var parent = $"../.."


func _on_mouse_entered() -> void:
	#size += Vector2(4,4)
	pass


func _on_mouse_exited() -> void:
	#size -= Vector2(4,4)
	pass
	




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
		"level_lights" : int($"../../StatsPanel/Level".lights_on),
		"comment" : str($"../../Comment/TextEdit".text)
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
	save_images(folder_path)


func _on_button_down() -> void:
	$"../../SaveDialog".popup()


func _on_file_dialog_dir_selected(dir: String) -> void:
	print("Selected directory: ", dir)
	save_data = save()  
	save_game(dir)





# Images

func save_images(dir):
	
	var count = 0
	
	for i in get_texture_rects_in_image_group():
		
		if i.is_in_group("CharacterPFP"):
			save_texture_rect_image(i, dir + "/" + "character.png")
		elif i.is_in_group("Item"):
			count += 1
			save_texture_rect_image(i, dir + "/" + "item" + str(count) + ".png")
		



func save_texture_rect_image(texture_rect: TextureRect, output_path: String):
	
	
	
	# Step 1: Get the texture
	var texture = texture_rect.texture
	if texture == null:
		print("No texture assigned to TextureRect.")
		return

	# Step 2: Convert to image
	var image: Image = texture.get_image()
	if image == null:
		print("Failed to get image from texture.")
		return

	# Step 3: Save to PNG
	var error = image.save_png(output_path)
	if error == OK:
		print("Image saved to: ", output_path)
	else:
		print("Failed to save image. Error code: ", error)

func get_texture_rects_in_image_group() -> Array:
	var texture_rects = []
	for node in get_tree().get_nodes_in_group("Image"):
		if node is TextureRect:
			texture_rects.append(node)
	return texture_rects
