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
var TraitDeCaracteresDispo = ["bagarreur", "intelligent"]
var NbTraitDeCaracteresDispo = TraitDeCaracteresDispo.size()

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
	my_character.attaque_value = randi() % 10 + 5
	my_character.competence = CompetenceDisponible[randi() % NbCompetence]
	my_character.competenceDescription = competenceDescription[my_character.competence]
	playerData.crew_size += 1
	my_character.add_to_crew()
	return my_character
