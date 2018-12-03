extends Node2D

var playerRef

var boss1HP = 5000
var maxboss1HP = 5000
var boss2HP = 10000
var maxboss2HP = 10000
var boss3HP = 15000
var maxboss3HP = 15000

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
var seats_size = 0
var neonRepairModifier = 1
var neonNextStageModifier = 1
var neonEarnedModifier = 1

var baseEngineRepairNeon = 15
var baseEngineScrapNeon = 10
var baseBrakeRepairNeon = 7
var baseBrakeScrapNeon = 5
var baseClutchRepairNeon = 6
var baseClutchScrapNeon = 4
var baseRWRepairNeon = 12
var baseRWScrapNeon = 9
var baseLWRepairNeon = 12
var baseLWScrapNeon = 9
var baseHPRepairNeon = 10
var baseHPScrapNeon = 10
var baseNeonNextStage = 100

var currentStage = 0
var nombreATuer = 0
var niveauFini = false 
var lanceBoss = false 

var songName

func _ready():
	for i in range(0, 4):
		seats.append(null)
	randomize()
	for i in range(0, 5):
		crew.append(null)
		
	crew[0] = characterManagement.randomize_new_character()
	crew[1] = characterManagement.randomize_new_character()

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func remove_robot(robot):
	robot.remove_from_crew()
	if seats.find(robot) != -1:
		seats_size -= 1
		seats[seats.find(robot)] = null
	crew.remove(crew.find(robot))
	crew.append(null)
	crew_size -= 1
	
func playShmupSong():
	if seats[2] == null:
		MusicPlayer.playSong("Dj0", 0.1, 0.1, 0)
	else:
		if seats[2].level == 1:
			MusicPlayer.playSong("Dj0", 0.1, 0.1, 0)
		if seats[2].level == 2:
			MusicPlayer.playSong("Dj1", 0.1, 0.1, 0)
		if seats[2].level == 3:
			MusicPlayer.playSong("Dj2", 0.1, 0.1, 0)
		if seats[2].level == 4:
			MusicPlayer.playSong("Dj3", 0.1, 0.1, 0)