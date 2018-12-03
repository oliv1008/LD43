extends Node2D

var level = 1
var attaque_value = 1
var competence = "vide"
var competence_value = 1
var trait_de_caractere = []
var portrait = preload("res://icon.png")
var robot_name = "B20-B4"
var quote = "Bang bang baaaaaang"
var trait = []

func _ready():
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
	
func display_character():
	print("----CHARACTER----")
	print("name = ", robot_name)
	print("level = ", level)
	print("attaque_value = ", attaque_value)
	print("competence = ", competence)
	print("competence_value = ", competence_value)
	print("trait de caractere = ", trait_de_caractere)
	print("portrait = ", portrait, "\n\n")