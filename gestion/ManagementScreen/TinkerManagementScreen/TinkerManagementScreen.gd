extends Control

export (PackedScene) var RobotInfoScreen
export (PackedScene) var MainScreen

onready var NeonLabel = $MainContainer/Neon
onready var EngineButton = $MainContainer/CarPartsContainer/EngineContainer/ButtonEngine
onready var BrakeButton = $MainContainer/CarPartsContainer/BrakeContainer/ButtonBrake
onready var ClutchButton = $MainContainer/CarPartsContainer/ClutchContainer/ButtonClutch
onready var RWButton = $MainContainer/CarPartsContainer/RightWheelContainer/ButtonRW
onready var LWButton = $MainContainer/CarPartsContainer/LeftWheelContainer/ButtonLW
onready var HPLabel = $MainContainer/CarPartsContainer/HPContainer/CenterContainer/HP

onready var RobotsButtons = [$MainContainer/ScrapContainer/CrewContainer/Robot1, \
							$MainContainer/ScrapContainer/CrewContainer/Robot2, \
							$MainContainer/ScrapContainer/CrewContainer/Robot3, \
							$MainContainer/ScrapContainer/CrewContainer/Robot4]
					
onready var ScrapButtons = [$MainContainer/ScrapContainer/ScrapButtonsContainer/ScrapButton1, \
							$MainContainer/ScrapContainer/ScrapButtonsContainer/ScrapButton2, \
							$MainContainer/ScrapContainer/ScrapButtonsContainer/ScrapButton3, \
							$MainContainer/ScrapContainer/ScrapButtonsContainer/ScrapButton4]

onready var PopUp = $MainContainer/DialogueContainer
onready var NeonEarnedLabel = $MainContainer/DialogueContainer/NeonEarned
onready var SacrificeLabel = $MainContainer/DialogueContainer/Sacrifice

var robot_to_scrap

func _ready():
	
	NeonLabel.text = str("Neon : ", playerData.neonLeft)

	if playerData.carParts["engine"]:
		EngineButton.text = str("Scrap (+10)")
	else:
		EngineButton.text = str("Repair (-10)")
		
	if playerData.carParts["brake"]:
		BrakeButton.text = str("Scrap (+10)")
	else:
		BrakeButton.text = str("Repair (-10)")
		
	if playerData.carParts["clutch"]:
		ClutchButton.text = str("Scrap (+10)")
	else:
		ClutchButton.text = str("Repair (-10)")
		
	if playerData.carParts["right_wheel"]:
		RWButton.text = str("Scrap (+10)")
	else:
		RWButton.text = str("Repair (-10)")
		
	if playerData.carParts["left_wheel"]:
		LWButton.text = str("Scrap (+10)")
	else:
		LWButton.text = str("Repair (-10)")
		
	HPLabel.text = str("HP : ", playerData.carHP, "/", playerData.carHPMax)
		
	for i in range(0, playerData.crew_size):
		RobotsButtons[i].texture_normal = playerData.crew[i].portrait
		RobotsButtons[i].visible = true
		ScrapButtons[i].visible = true

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().set_input_as_handled()
		get_tree().change_scene_to(MainScreen)

func _on_Robot1_pressed():
	var Robot1Info = RobotInfoScreen.instance()
	add_child(Robot1Info)
	Robot1Info.init(playerData.crew[0])

func _on_Robot2_pressed():
	var Robot2Info = RobotInfoScreen.instance()
	add_child(Robot2Info)
	Robot2Info.init(playerData.crew[1])

func _on_Robot3_pressed():
	var Robot3Info = RobotInfoScreen.instance()
	add_child(Robot3Info)
	Robot3Info.init(playerData.crew[2])

func _on_Robot4_pressed():
	var Robot4Info = RobotInfoScreen.instance()
	add_child(Robot4Info)
	Robot4Info.init(playerData.crew[3])

func _on_ScrapButton1_pressed():
	robot_to_scrap = playerData.crew[0]
	popup()

func _on_ScrapButton2_pressed():
	robot_to_scrap = playerData.crew[1]
	popup()

func _on_ScrapButton3_pressed():
	robot_to_scrap = playerData.crew[2]
	popup()

func _on_ScrapButton4_pressed():
	robot_to_scrap = playerData.crew[3]
	popup()
	
func popup():
	NeonEarnedLabel.text = str("Neon earn : ", robot_to_scrap.level * 10)
	SacrificeLabel.text = str("Sacrifice ", robot_to_scrap.robot_name, " ?")
	PopUp.visible = true

func _on_No_pressed():
	robot_to_scrap = null
	PopUp.visible = false

func _on_Yes_pressed():
	playerData.neonLeft += robot_to_scrap.level * 10
	playerData.remove_robot(robot_to_scrap)
	get_tree().reload_current_scene()


func _on_ButtonEngine_pressed():
	if playerData.carParts["engine"]:
		playerData.carParts["engine"] = false
		playerData.neonLeft += 10
	else:
		if playerData.neonLeft > 10:
			playerData.carParts["engine"] = true
			playerData.neonLeft -= 10
	get_tree().reload_current_scene()


func _on_ButtonClutch_pressed():
	if playerData.carParts["clutch"]:
		playerData.carParts["clutch"] = false
		playerData.neonLeft += 10
	else:
		if playerData.neonLeft > 10:
			playerData.carParts["clutch"] = true
			playerData.neonLeft -= 10
	get_tree().reload_current_scene()


func _on_ButtonBrake_pressed():
	if playerData.carParts["brake"]:
		playerData.carParts["brake"] = false
		playerData.neonLeft += 10
	else:
		if playerData.neonLeft > 10:
			playerData.carParts["brake"] = true
			playerData.neonLeft -= 10
	get_tree().reload_current_scene()


func _on_ButtonRW_pressed():
	if playerData.carParts["right_wheel"]:
		playerData.carParts["right_wheel"] = false
		playerData.neonLeft += 10
	else:
		if playerData.neonLeft > 10:
			playerData.carParts["right_wheel"] = true
			playerData.neonLeft -= 10
	get_tree().reload_current_scene()


func _on_ButtonLW_pressed():
	if playerData.carParts["left_wheel"]:
		playerData.carParts["left_wheel"] = false
		playerData.neonLeft += 10
	else:
		if playerData.neonLeft > 10:
			playerData.carParts["left_wheel"] = true
			playerData.neonLeft -= 10
	get_tree().reload_current_scene()


func _on_ButtonScrap_pressed():
	if playerData.carHP > 10:
		playerData.carHP -= 10
		playerData.neonLeft += 10
	get_tree().reload_current_scene()


func _on_ButtonRepair_pressed():
	if playerData.neonLeft >= 10 and playerData.carHP <= 90:
		playerData.neonLeft -= 10
		playerData.carHP += 10
	get_tree().reload_current_scene()
