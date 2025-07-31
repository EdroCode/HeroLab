extends Control

@export var enemy_on : Texture
@export var enemy_off : Texture

@export var sound_on : Texture
@export var sound_off : Texture

var music_bus = AudioServer.get_bus_index("Master")

var enemy_clear = false
var sound = true

func _ready() -> void:
	$"../SelectMenuPanel".visible = false
	visible = false



func _on_settings_button_down() -> void:
	visible = !visible



func _on_audio_button_down() -> void:
	sound = !sound
	if sound:
		$Panel/Audio.icon = sound_on
	else:
		$Panel/Audio.icon = sound_off
		
	AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))




func _on_clear_enemy_check_button_down() -> void:
	enemy_clear = !enemy_clear
	
	if enemy_clear:
		$Panel/ClearEnemyCheck.icon = enemy_on
	else:
		$Panel/ClearEnemyCheck.icon = enemy_off
		

var select_menu_opened = false

func _on_select_mode_button_button_down() -> void:
	select_menu_opened = !select_menu_opened
	
	if select_menu_opened:
		$"../SelectMenuPanel".visible= true
	else:
		$"../SelectMenuPanel".visible = false
	


func _on_duel_button_button_down() -> void:
	select_menu_opened = false
	$"../SelectMenuPanel".visible = false
	$"../Batalha".visible = true
	$"../SidePanel".visible = false
	$"../Shop".visible = false
	
