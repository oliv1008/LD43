extends Node2D

# class member variables go here, for example:
var CharacterScene = preload("res://gestion/characters/Character.tscn")

var CompetenceDisponible = ["Tinker", "Ecologist", "Fighter", "Biodegradable", "Greedy"]
var competenceDescription = {"Tinker" : "-20% to repair cost", \
							"Ecologist" : "-10% to neon consumption by the car", \
							"Fighter" : "+20% damage", \
							"Biodegradable" : "+50% neon earned when scraped", \
							"Greedy" : "+10% to earned scrap"}
var NbCompetence = CompetenceDisponible.size()
var TraitDeCaracteresDispo = ["Gambler", "Insane dancer", "language doc", "Countryman", "Anarchist", "Soundcloud rapper", "Boulimic", \
							"Firefighter", "Childish", "Pro poker player", "Music doc", "Nice guy", "Scooby-doo fan", "Wrestler", "Love to fight", "bold", \
							"Happy", "Dumb", "Grumpy", "Sleepy", "Dopey", "Bashful", "Sneazy"]
var NbTraitDeCaracteresDispo = TraitDeCaracteresDispo.size()
var trait_dispo

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func randomize_new_character():
	var my_character = CharacterScene.instance()
	my_character.attaque_value = randi() % 4 + 10
	my_character.competence = CompetenceDisponible[randi() % NbCompetence]
	my_character.competenceDescription = competenceDescription[my_character.competence]
	for i in range(0, randi() % 3 + 1):
		trait_dispo = TraitDeCaracteresDispo
		my_character.trait.append((trait_dispo [randi() % 19]))
	playerData.crew_size += 1
	my_character.add_to_crew()
	return my_character
	
func new_unique_character(name):
	if name == "B20-B4":
		pass
	if name == "D4\/1D GH3T0":
		pass
	if name == "R3D3":
		pass
