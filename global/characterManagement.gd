extends Node2D

# class member variables go here, for example:
var CharacterScene = preload("res://gestion/characters/Character.tscn")

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
	my_character.competence = playerData.CompetenceDisponible[randi() % playerData.NbCompetence]
	my_character.competence_value = rand_array(playerData.ValeurCompetenceDisponible[my_character.competence])
	return my_character
	
func rand_array(array):
	return (randi() % (array[1] - array[0])) + array[0]
	
func on_mechano_enter(value):
	pass
	
func on_mechano_exit(value):
	pass
	
func on_tireur_enter(value):
	pass
	
func on_tireur_exit(value):
	pass