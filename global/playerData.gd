extends Node2D

#Indique l'état des parties de la voiture
var CarParts = {"right_wheel" : true,
				"left_wheel" : true,
				"brake" : true,
				"engine" : true,
				"clutch" : true}
var CarHP = 100
var Crew = []



func _ready():
	randomize()
	for i in range(0, 5):
		Crew.append(characterManagement.randomize_new_character())
		Crew[i].display_character()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
