extends Control


const curiosidadesPokemon = [
  "Pokemon e a abreviacao de 'Pocket Monsters', que significa 'Monstros de Bolso'.",
  "Pikachu e o mascote oficial da franquia Pokemon.",
  "A franquia Pokemon foi criada por Satoshi Tajiri em 1996.",
  "O primeiro jogo lancado foi Pokemon Red e Green, no Japao, para o Game Boy.",
  "Existem atualmente mais de 1000 Pokemon diferentes!",
  "O Pokemon numero 001 na Pokedex e o Bulbasaur (Bulbassauro).",
  "O Pokemon numero 151 da 1a geracao e o lendario Mew.",
  "Arceus e considerado o Pokemon criador do universo.",
  "Ditto pode se transformar em qualquer outro Pokemon.",
  "Eevee tem varias evolucoes possiveis, dependendo do metodo usado.",
  "Meowth e um dos poucos Pokemon que sabe falar a lingua humana no anime.",
  "O nome do Ash no Japao e Satoshi, em homenagem ao criador da serie.",
  "Pikachu foi originalmente planejado para ser o unico Pokemon de Ash.",
  "Existem Pokemon inspirados em objetos, como Klefki (chaveiro) e Vanillite (sorvete).",
  "O Pokemon mais pesado da Pokedex e o Celesteela, com 2204,4 kg.",
  "O mais leve e o Gastly, que pesa 0,1 kg.",
  "O Pokemon mais alto e Eternatus, com 20 metros de altura.",
  "O menor e o Flabebe, com apenas 10 cm.",
  "Existem tipos elementares como Fogo, Agua, Planta, Psiquico, Dragao, Fada, entre outros.",
  "O jogo Pokemon GO, lancado em 2016, popularizou novamente a franquia globalmente.",
  "Magikarp e considerado um dos Pokemon mais fracos, mas evolui para o poderoso Gyarados.",
  "Charizard nao e do tipo Dragao, apesar da aparencia.",
  "Na 1a geracao, havia apenas 151 Pokemon.",
  "O lendario MissingNo. e um glitch famoso nos jogos Pokemon Red/Blue.",
  "A franquia Pokemon e uma das mais lucrativas da historia do entretenimento.",
  "Existem Pokemon fosseis, inspirados em dinossauros e criaturas extintas.",
  "Pokemon Snap e um jogo onde o objetivo e fotografar Pokemon.",
  "Alguns Pokemon so evoluem com amizade, como o Togepi.",
  "Existem Pokemon baseados em mitologia japonesa, como Ninetales e Yveltal.",
  "O Pokemon Cubone sempre usa o cranio da mae falecida.",
  "O numero de Pokemon lendarios aumentou com cada geracao.",
  "Alguns Pokemon tem formas regionais, como Vulpix de Alola.",
  "Existem Pokemon exclusivos por versao dos jogos (ex: Scyther em Red e Pinsir em Blue).",
  "Team Rocket e a organizacao vila mais famosa do anime.",
  "Ash Ketchum finalmente venceu uma liga Pokemon em Alola (Sun & Moon).",
  "O Pokemon Jigglypuff canta e faz todos dormirem",
  "A primeira vez que Pokemon foi exibido no Brasil foi em 1999.",
  "A musica de abertura brasileira do anime ficou muito popular: 'Temos que pegar!'.",
  "Shiny Pokemon sao versoes raras com cores diferentes.",
  "Em alguns jogos, os Pokemon podem Mega Evoluir durante a batalha."
];



func _ready() -> void:
	var i = randi_range(0, len(curiosidadesPokemon))
	$Comment/TextEdit.placeholder_text = curiosidadesPokemon[i - 1]
	$Shop.visible = false
	$Batalha.visible = false




func _physics_process(delta: float) -> void:
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		$AudioStreamPlayer.play()

		




# Save

func count_stars():
	
	var stars = 0
	
	for i in $UpperBar/StarBar/VBoxContainer.get_children():
		if i.selected:
			stars += 1
	
	return stars

func count_luck():
	
	var luck = 0
	
	for i in $UpperBar/TrevoBar/VBoxContainer.get_children():
		if i.selected:
			luck += 1
	
	return luck

func count_hearts():
	
	var hearts = 0
	
	for i in $SidePanel/Hearts/HBoxContainer.get_children():
		if i.selected:
			hearts += 1
	
	return hearts

# Load

func set_stars(number):
	
	for i in number:
		var star = $UpperBar/StarBar/VBoxContainer.get_child(i)
		star.select()

func set_luck(number):
	for i in number:
		i += 1
		var trevo = $UpperBar/TrevoBar/VBoxContainer.get_child(-i)
		trevo.select()


func _on_arrow_button_down() -> void:
	
	$Comment.visible = !$Comment.visible




func _on_money_input_text_changed() -> void:
	var count = 0
	var chars = []
	
	for i in $Inventory/Money/MoneyInput.text:
		count += 1
		chars.append(i)
	
	if count > 3:
		var word = chars[0] + chars[1] + chars[2]
		$Inventory/Money/MoneyInput.text = str(word)
	
	count = 0
	chars.clear()
