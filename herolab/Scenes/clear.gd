extends Button


func _on_button_down() -> void:
	
	$"../EnemyPlacer/VideoStreamPlayer".visible = true
	
	var time = Timer.new()
	add_child(time)
	time.wait_time = 1.5
	time.start()
	
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
	
	for i in get_texture_rects_in_image_group():
		i.texture = null
	

	await time.timeout
	
	time.stop()
	time.queue_free()
	$"../EnemyPlacer/VideoStreamPlayer".visible = false


func get_texture_rects_in_image_group() -> Array:
	var texture_rects = []
	for node in get_tree().get_nodes_in_group("Image"):
		if node is TextureRect:
			texture_rects.append(node)
	return texture_rects
