extends Control

var eventos = [
	"um inimigo",
	"um inimigo",
	"uma ruína antiga",
	"um pequeno tesouro",
	"um artefato",
	"Nada",
	"um bau perdido",
	"uma entrada suspeita",
	"um vendedor ambulante",
	"um vilarejo",
	"???"
]

func _ready() -> void:
	randomize()
	$Barra/TextoBarra.text = ""
	$Barra/TextoBarra.visible = false
	$AnimationPlayer.play("RESET")


func _on_caverna_button_down() -> void:
	var evento_aleatorio = eventos[randi() % eventos.size()]
	#print(evento_aleatorio)
	var result = "Voce entrou numa caverna - Voce encontrou " + evento_aleatorio
	set_text(result)

func _on_piramide_button_down() -> void:
	var evento_aleatorio = eventos[randi() % eventos.size()]
	#print(evento_aleatorio)
	var result = "Voce entrou numa Piramide - Voce encontrou " + evento_aleatorio
	set_text(result)

func _on_ilha_button_down() -> void:
	var evento_aleatorio = eventos[randi() % eventos.size()]
	#print(evento_aleatorio)
	var result = "Voce chegou numa ilha - Voce encontrou " + evento_aleatorio
	set_text(result)

func _on_iglo_button_down() -> void:
	var evento_aleatorio = eventos[randi() % eventos.size()]
	#print(evento_aleatorio)
	var result = "Voce chegou numa cidade congelada - Voce encontrou " + evento_aleatorio
	set_text(result)

func _on_cidade_button_down() -> void:
	var evento_aleatorio = eventos[randi() % eventos.size()]
	#print(evento_aleatorio)
	var result = "Voce chegou numa cidade - Voce encontrou " + evento_aleatorio
	set_text(result)

func _on_ponte_button_down() -> void:
	var evento_aleatorio = eventos[randi() % eventos.size()]
	#print(evento_aleatorio)
	var result = "Voce encontrou uma ponte - Voce encontrou " + evento_aleatorio
	set_text(result)

func _on_montanha_button_down() -> void:
	var evento_aleatorio = eventos[randi() % eventos.size()]
	#print(evento_aleatorio)
	var result = "Voce alcancou uma montanha - Voce encontrou " + evento_aleatorio
	set_text(result)


func _on_floresta_button_down() -> void:
	var evento_aleatorio = eventos[randi() % eventos.size()]
	#print(evento_aleatorio)
	var result = "Voce entrou em uma floresta - Voce encontrou " + evento_aleatorio
	set_text(result)




func set_text(frase):
	$Barra/TextoBarra.text = frase
	$AnimationPlayer.play("RESET")
	$Barra/TextoBarra.visible = true
	$AnimationPlayer.play("Appear")
	await $AnimationPlayer.animation_finished
	$Barra/TextoBarra.text = frase
	$AnimationPlayer.play("Fade")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play("RESET")


func increase(x):
	x.scale += Vector2(0.1,0.1)

func decrease(x):
	x.scale -= Vector2(0.1,0.1)


func _on_caverna_mouse_entered() -> void:
	increase($Elements/Caverna)

func _on_caverna_mouse_exited() -> void:
	decrease($Elements/Caverna)

func _on_piramide_mouse_entered() -> void:
	increase($Elements/Piramide)

func _on_piramide_mouse_exited() -> void:
	decrease($Elements/Piramide)

func _on_ilha_mouse_entered() -> void:
	increase($Elements/Ilha)

func _on_ilha_mouse_exited() -> void:
	decrease($Elements/Ilha)

func _on_iglo_mouse_entered() -> void:
	increase($Elements/Iglo)

func _on_iglo_mouse_exited() -> void:
	decrease($Elements/Iglo)

func _on_cidade_mouse_entered() -> void:
	increase($Elements/Cidade)

func _on_cidade_mouse_exited() -> void:
	decrease($Elements/Cidade)

func _on_ponte_mouse_entered() -> void:
	increase($Elements/Ponte)

func _on_ponte_mouse_exited() -> void:
	decrease($Elements/Ponte)

func _on_montanha_mouse_entered() -> void:
	increase($Elements/Montanha)

func _on_montanha_mouse_exited() -> void:
	decrease($Elements/Montanha)

func _on_floresta_mouse_entered() -> void:
	increase($Elements/Floresta)

func _on_floresta_mouse_exited() -> void:
	decrease($Elements/Floresta)
