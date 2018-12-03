extends Node2D

# class member variables go here, for example:
var CharacterScene = preload("res://gestion/characters/Character.tscn")

var portraitPath = "res://gestion/portraits/Portrait"

var nameRobot = ["W4LL-3", "N0N0", "R3D3", "CHUCK-N0RID3", "T3RM1N4T0R", \
				"HAL-9000", "M1CK3Y D3AD M0U5E", "C0M TRUISE", "A.W.E.S.O.M.-O 4000", \
				"ED-209", "D4FT PUNK", "B3NDER", "M4RVIN", "OPTIMUS-PRIME", "CL4P TR4P", \
				"CL4P TR4P", "MARIA", "GLADOS"]
var quote = {"W4LL-3" : "Who the fuck is 3V3 ?", \
					"N0N0" : "Still looking for some nails", \
					"R3D3" : "Claim he took part in a big war a long time ago in a galaxy far far away, probably a liar anyway", \
					"CHUCK-N0RID3" : "Used to ride horses in Texas, but not anymore", \
					"T3RM1N4T0R" : "If he would be a famous composer, he'll be Bach", \
					"HAL-9000" : "His full name is Heuristicaly programmed ALgorithmic computer, but you can call him HAL", \
					"M1CK3Y D3AD M0U5E" : "Richer mouse AND DJ in the world", \
					"C0M TRUISE" : "Spy, aviator, musician, ... He can do everything", \
					"A.W.E.S.O.M.-O 4000" : "He's not a robot, he's a computer automatron", \
					"ED-209" : "You have to comply", \
					"D4FT PUNK" : "Claims that annoying electronic sound is music", \
					"B3NDER" : "Has got a serious problem with booze", \
					"M4RVIN" : "A paranoid android who didn't ask to be made", \
					"OPTIMUS-PRIME" : "The one from the TV show, not the M.B movies", \
					"CL4P TR4P" : "WUB wub wub DROP ! wub", \
					"MARIA" : "Not so optimistic", \
					"GLADOS" : "She's still alive"}
var numberOfName = nameRobot.size()

var CompetenceDisponible = ["Tinker", "Ecologist", "Fighter", "Biodegradable", "Greedy", "Brawler"]
var competenceDescription = {"Tinker" : "-20% to repair cost", \
							"Ecologist" : "-10% to neon consumption by the car", \
							"Fighter" : "+20% damage", \
							"Biodegradable" : "+50% neon earned when scraped", \
							"Greedy" : "+10% to earned scrap", \
							"Brawler" : "+40% damage"}
var NbCompetence = CompetenceDisponible.size()
var TraitDeCaracteresDispo = ["Gambler", "Insane dancer", "language doc", "Countryman", "Anarchist", "Soundcloud rapper", "Boulimic", \
							"Firefighter", "Childish", "Pro poker player", "Music doc", "Nice guy", "Scooby-doo fan", "Wrestler", "Love to fight", "bold", \
							"Happy", "Dumb", "Grumpy", "Sleepy", "Dopey", "Bashful", "Sneazy"]
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
	var portraitRand = randi() % 12 + 1
	my_character.portrait = load(str(portraitPath, portraitRand, ".png"))
	var nameRand = randi() % numberOfName
	my_character.robot_name = nameRobot[nameRand]
	my_character.quote = quote[my_character.robot_name]
	my_character.base_attaque_value = randi() % 4 + 10
	my_character.competence = CompetenceDisponible[randi() % NbCompetence]
	my_character.competenceDescription = competenceDescription[my_character.competence]
	for i in range(0, randi() % 3 + 1):
		var trait_a_rajouter = TraitDeCaracteresDispo [randi() % NbTraitDeCaracteresDispo]
		if !my_character.trait.has(trait_a_rajouter):
			my_character.trait.append(trait_a_rajouter)
	playerData.crew_size += 1
	my_character.reload_attaque_value()
	my_character.add_to_crew()
	return my_character
	
func new_unique_character(name):
	if name == "B20-B4":
		var my_character = CharacterScene.instance()
		my_character.robot_name = "B20-B4"
		my_character.quote = "Bang bang baaaaang"
		my_character.base_attaque_value = randi() % 4 + 10
		my_character.competence = "Brawler"
		my_character.competenceDescription = competenceDescription[my_character.competence]
		for i in range(0, randi() % 3 + 1):
			var trait_a_rajouter = TraitDeCaracteresDispo [randi() % NbTraitDeCaracteresDispo]
			if !my_character.trait.has(trait_a_rajouter):
				my_character.trait.append(trait_a_rajouter)
		playerData.crew_size += 1
		my_character.reload_attaque_value()
		my_character.add_to_crew()
		return my_character