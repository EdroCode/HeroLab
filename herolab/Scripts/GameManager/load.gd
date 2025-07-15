extends Button

@onready var parent = $"../.."
@onready var attack = $"../../CharacterData/Stats/Attack"
@onready var defense = $"../../CharacterData/Stats/Defense"
@onready var hp = $"../../CharacterData/Stats/HP"
@onready var level_light = $"../../StatsPanel/Level"

func _on_mouse_entered() -> void:
	size += Vector2(4,4)


func _on_mouse_exited() -> void:
	size -= Vector2(4,4)


func load_game(path):
	
	
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
		
		# Loading variables
		$"../../StatsPanel/NameInput".text = c_name
		$"../../StatsPanel/LevelInput".text = str(level)
		$"../../Inventory/Money/MoneyInput".text = str(money)
		
		parent.set_stars(n_star)
		parent.set_luck(n_luck)
		attack.set_points(att_points)
		defense.set_points(def_points)
		hp.set_points(hp_points)
		level_light.set_points(n_level)
		
		
		
		






func _on_button_down() -> void:
	$"../../LoadDialog".popup()


func _on_load_dialog_file_selected(path: String) -> void:
	load_game(path)
