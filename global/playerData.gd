extends Node2D

#Indique l'état des parties de la voiture
var CarParts = {"right_wheel" : true,
				"left_wheel" : true,
				"brake" : true,
				"engine" : true,
				"clutch" : true}
var CarHP = 100
var Crew = []

var CompetenceDisponible = ["mechano", "tireur"]
var ValeurCompetenceDisponible = {"mechano" : [10, 30],
									"tireur" : [10, 20]}
var NbCompetence = CompetenceDisponible.size()
var TraitDeCaracteresDispo = ["bagarreur", "intelligent"]
var NbTraitDeCaracteresDispo = TraitDeCaracteresDispo.size()

func _ready():
	randomize()
	for i in range(0, 5):
		Crew.append(characterManagement.randomize_new_character())
		Crew[i].display_character()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
