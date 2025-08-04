extends Control

var panel = "inventory"

@onready var inventory = $Items
@onready var money = $Money
@onready var abacadex = $AbacaDex

func _ready() -> void:
	
	panel = "inventory"
	inventory.visible = true
	money.visible = false
	abacadex.visible = false
	


func _on_inventory_button_button_down() -> void:
	if panel != "inventory":
		panel = "inventory"
		inventory.visible = true
		money.visible = false
		abacadex.visible = false


func _on_abacamons_button_button_down() -> void:
	if panel != "abacadex":
		panel = "abacadex"
		abacadex.visible = true
		inventory.visible = false
		money.visible = false


func _on_money_button_button_down() -> void:
	if panel != "money":
		panel = "money"
		money.visible = true
		abacadex.visible = false
		inventory.visible = false
