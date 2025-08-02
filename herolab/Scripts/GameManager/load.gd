extends Button

@onready var parent = $"../.."
@onready var attack = $"../../CharacterData/Stats/Attack"
@onready var defense = $"../../CharacterData/Stats/Defense"
@onready var hp = $"../../CharacterData/Stats/HP"
@onready var level_light = $"../../StatsPanel/Level"

func _on_mouse_entered() -> void:
	#size += Vector2(4,4)
	pass


func _on_mouse_exited() -> void:
#	size -= Vector2(4,4)
	pass


func load_game_data(path):
	
	
	
	var save_file = FileAccess.open(path, FileAccess.READ)
	while save_file.get_position() < save_file.get_length():
		var json_string = save_file.get_line()

		var json = JSON.new()

		var parse_result = json.parse(json_string)
		if not parse_result == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", json_string, " at line ", json.get_error_line())
			continue
		
		var data = json.data
		
		print(data)
		
		var c_name = data["name"]
		var level = int(data["level"])
		var n_star = int(data["popularity"])
		var n_luck = int(data["luck"])
		var n_level = int(data["level_lights"])
		var att_points = int(data["attack_points"])
		var def_points = int(data["def_points"])
		var hp_points = int(data["hp_points"])
		var money = int(data["money"])
		var comment = str(data["comment"])
		
		# Loading variables
		$"../../StatsPanel/NameInput".text = c_name
		$"../../StatsPanel/LevelInput".text = str(level)
		$"../../Inventory/Money/MoneyInput".text = str(money)
		
		$"../../Comment/TextEdit".text = comment
		
		parent.set_stars(n_star)
		parent.set_luck(n_luck)
		attack.set_points(att_points)
		defense.set_points(def_points)
		hp.set_points(hp_points)
		level_light.set_points(n_level)
		
		
		
		






func _on_button_down() -> void:
	$"../../LoadDialog".popup()


func _on_load_dialog_file_selected(path: String) -> void:
	#load_game(path)
	pass


func _on_load_dialog_dir_selected(dir: String) -> void:
	
	load_game_data(find_first_save_file_in_dir(dir))
	load_images(dir)


func find_first_save_file_in_dir(dir_path: String) -> String:
	var dir = DirAccess.open(dir_path)
	if not dir:
		print("Failed to open directory: ", dir_path)
		return ""

	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		if not dir.current_is_dir() and file_name.ends_with(".save"):
			var full_path = dir_path + "/" + file_name
			dir.list_dir_end()
			print("Found save file: ", full_path)
			return full_path
		file_name = dir.get_next()

	dir.list_dir_end()
	print("No .save file found in: ", dir_path)
	return ""




# Images


func load_images(dir):
	assign_pngs_to_texture_rects(dir)
	





func assign_pngs_to_texture_rects(directory_path: String) -> void:
	var dir = DirAccess.open(directory_path)
	if dir == null:
		push_error("Cannot open directory: " + directory_path)
		return

	dir.list_dir_begin()
	var files = []

	var file_name = dir.get_next()
	while file_name != "":
		if not dir.current_is_dir() and file_name.ends_with(".png"):
			files.append(directory_path + "/" + file_name)
		file_name = dir.get_next()
	dir.list_dir_end()

	var texture_rects = get_texture_rects_in_image_group()

	for i in range(min(files.size(), texture_rects.size())):
		var image = Image.new()
		var error = image.load(files[i])
		if error != OK:
			push_error("Failed to load image: " + files[i])
			continue
		
		# Codigo horrivel, talvez melhorar no futuro
		var texture = ImageTexture.create_from_image(image)
		if files[i].get_file().to_lower() == "character.png":
			$"../../CharacterData/CharacterPlacer".get_child(1).texture = texture
			print("woba")
		elif files[i].get_file().to_lower() == "item1.png":
			$"../../CharacterData/ItemPlacer".get_child(1).texture = texture
		elif files[i].get_file().to_lower() == "item2.png":
			$"../../CharacterData/ItemPlacer2".get_child(1).texture = texture
		elif files[i].get_file().to_lower() == "item3.png":
			$"../../Inventory/Items/ItemPlacer".get_child(1).texture = texture
		elif files[i].get_file().to_lower() == "item4.png":
			$"../../Inventory/Items/ItemPlacer2".get_child(1).texture = texture
		elif files[i].get_file().to_lower() == "item5.png":
			$"../../Inventory/Items/ItemPlacer3".get_child(1).texture = texture
		elif files[i].get_file().to_lower() == "item6.png":
			$"../../Inventory/Items/ItemPlacer4".get_child(1).texture = texture
		elif files[i].get_file().to_lower() == "item7.png":
			$"../../Inventory/Items/ItemPlacer5".get_child(1).texture = texture
		elif files[i].get_file().to_lower() == "item8.png":
			$"../../Inventory/Items/ItemPlacer6".get_child(1).texture = texture
		elif files[i].get_file().to_lower() == "abacamon1.png":
			$"../../Inventory/AbacaDex/ItemPlacer".get_child(1).texture = texture
		elif files[i].get_file().to_lower() == "abacamon2.png":
			$"../../Inventory/AbacaDex/ItemPlacer2".get_child(1).texture = texture
		elif files[i].get_file().to_lower() == "abacamon3.png":
			$"../../Inventory/AbacaDex/ItemPlacer3".get_child(1).texture = texture
		elif files[i].get_file().to_lower() == "abacamon4.png":
			$"../../Inventory/AbacaDex/ItemPlacer4".get_child(1).texture = texture
		elif files[i].get_file().to_lower() == "abacamon5.png":
			$"../../Inventory/AbacaDex/ItemPlacer5".get_child(1).texture = texture
		elif files[i].get_file().to_lower() == "abacamon6.png":
			$"../../Inventory/AbacaDex/ItemPlacer6".get_child(1).texture = texture
		else:
			pass



func get_texture_rects_in_image_group() -> Array:
	var texture_rects = []
	for node in get_tree().get_nodes_in_group("Image"):
		if node is TextureRect:
			texture_rects.append(node)
	return texture_rects
