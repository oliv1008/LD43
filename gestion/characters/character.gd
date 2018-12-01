extends Node2D

var level
var attaque_value
var competence
var competence_value
var trait_de_caractere = []
var portrait

func _ready():
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
	
func display_character():
	print("----CHARACTER----")
	print("level = ", level)
	print("attaue_value = ", attaque_value)
	print("competence = ", competence)
	print("competence_value = ", competence_value)
	print("trait de caractere = ", trait_de_caractere)
	print("portrait = ", portrait, "\n\n")