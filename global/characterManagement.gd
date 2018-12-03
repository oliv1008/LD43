extends Node2D

# class member variables go here, for example:
var CharacterScene = preload("res://gestion/characters/Character.tscn")

var CompetenceDisponible = ["mechano", "tireur"]
var ValeurCompetenceDisponible = {"mechano" : [10, 30],
									"tireur" : [10, 20]}
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
	my_character.attaque_value = (randi() % 10) + 1
	my_character.competence = CompetenceDisponible[randi() % NbCompetence]
	my_character.competence_value = rand_array(ValeurCompetenceDisponible[my_character.competence])
	playerData.crew_size += 1
	return my_character
	
func rand_array(array):
	return (randi() % (array[1] - array[0])) + array[0]
