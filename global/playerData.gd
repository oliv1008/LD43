extends Node2D

var playerRef

var boss1HP = 20
var maxboss1HP = 200
var boss2HP = 40
var maxboss2HP = 400
var boss3HP = 60
var maxboss3HP = 600

#Indique l'état des parties de la voiture
var carParts = {"right_wheel" : true,
				"left_wheel" : true,
				"brake" : true,
				"engine" : true,
				"clutch" : true}
var carHP = 100
var maxCarHP = 100
var neonLeft = 100
var crew = []
var crew_size = 0
var seats = []
var currentStage = 1

var nombreATuer = 5

func _ready():
	for i in range(0, 4):
		seats.append(null)
	randomize()
	for i in range(0, 4):
		crew.append(null)
		
	crew[0] = characterManagement.randomize_new_character()
	crew[1] = characterManagement.randomize_new_character()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func remove_robot(robot):
	seats[seats.find(robot)] = 0
	crew.remove(crew.find(robot))
	crew.append(null)
	crew_size -= 1