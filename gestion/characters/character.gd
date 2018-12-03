extends Node2D

var level = 1
var base_attaque_value = 1
var attaque_value = 1
var competence = "vide"
var competenceDescription = "vide"
var trait_de_caractere = []
var portrait = preload("res://icon.png")
var robot_name = "B20-B4"
var quote = "Bang bang baaaaaang"
var trait = []
var currentSeat = null
var neonScrapModifier = 1
var damageModifier = 1
var scrapModifier = 1

func _ready():
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func add_to_crew():
	if competence == "Tinker":
		playerData.neonRepairModifier -= 0.2
	elif competence == "Ecologist":
		playerData.neonNextStageModifier -= 0.1
	elif competence == "Fighter":
		damageModifier += 0.2
	elif competence == "Biodegradable":
		scrapModifier += 0.5
	elif competence == "Greedy":
		playerData.neonEarnedModifier += 0.1
	elif competence == "Brawler":
		damageModifier += 0.4
		
func remove_from_crew():
	if competence == "Tinker":
		playerData.neonRepairModifier += 0.2
	elif competence == "Ecologist":
		playerData.neonNextStageModifier += 0.1
	elif competence == "Greedy":
		playerData.neonEarnedModifier -= 0.1

func add_to_seat1():
	currentSeat = 1
	damageModifier += 0.2
	print("on entre : damageModifier = ", damageModifier)
	reload_attaque_value()
	
func add_to_seat2():
	currentSeat = 2
	
func add_to_seat3():
	currentSeat = 3
	
func add_to_seat4():
	currentSeat = 4
	
func remove_from_seat():
	if currentSeat == 1:
		damageModifier -= 0.2
		print("on sort : damageModifier = ", damageModifier)

	reload_attaque_value()
		
func reload_attaque_value():
	attaque_value = base_attaque_value * damageModifier
	
func level_up():
	level += 1
	base_attaque_value += 1
	reload_attaque_value()
	
func display_character():
	print("----CHARACTER----")
	print("name = ", robot_name)
	print("level = ", level)
	print("attaque_value = ", attaque_value)
	print("competence = ", competence)
	print("trait de caractere = ", trait_de_caractere)
	print("portrait = ", portrait, "\n\n")