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

var EngineScrapNeon = playerData.baseEngineScrapNeon * playerData.neonEarnedModifier
var EngineRepairNeon = playerData.baseEngineRepairNeon * playerData.neonRepairModifier
var BrakeScrapNeon = playerData.baseBrakeScrapNeon * playerData.neonEarnedModifier
var BrakeRepairNeon = playerData.baseBrakeRepairNeon * playerData.neonRepairModifier
var ClutchScrapNeon = playerData.baseClutchScrapNeon * playerData.neonEarnedModifier
var ClutchRepairNeon = playerData.baseClutchRepairNeon * playerData.neonRepairModifier
var RWScrapNeon = playerData.baseRWScrapNeon * playerData.neonEarnedModifier
var RWRepairNeon = playerData.baseRWRepairNeon * playerData.neonRepairModifier
var LWScrapNeon = playerData.baseLWScrapNeon * playerData.neonEarnedModifier
var LWRepairNeon = playerData.baseLWRepairNeon * playerData.neonRepairModifier
var HPScrapNeon = playerData.baseHPScrapNeon * playerData.neonEarnedModifier
var HPRepairNeon = playerData.baseHPRepairNeon * playerData.neonRepairModifier
var NeonToNextStage = playerData.baseNeonNextStage * playerData.neonNextStageModifier

func _ready():
	
	NeonLabel.text = str("Neon : ", playerData.neonLeft)

	if playerData.carParts["engine"]:
		EngineButton.text = str("Scrap (+", EngineScrapNeon, ")")
	else:
		EngineButton.text = str("Repair (-", EngineRepairNeon, ")")
		
	if playerData.carParts["brake"]:
		BrakeButton.text = str("Scrap (+", BrakeScrapNeon, ")")
	else:
		BrakeButton.text = str("Repair (-", BrakeRepairNeon, ")")
		
	if playerData.carParts["clutch"]:
		ClutchButton.text = str("Scrap (+", ClutchScrapNeon, ")")
	else:
		ClutchButton.text = str("Repair (-", ClutchRepairNeon, ")")
		
	if playerData.carParts["right_wheel"]:
		RWButton.text = str("Scrap (+", RWScrapNeon, ")")
	else:
		RWButton.text = str("Repair (-", RWRepairNeon, ")")
		
	if playerData.carParts["left_wheel"]:
		LWButton.text = str("Scrap (+", LWScrapNeon, ")")
	else:
		LWButton.text = str("Repair (-", LWRepairNeon, ")")
		
	HPLabel.text = str("HP : ", playerData.carHP, "/", playerData.maxCarHP)
		
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
	
func _on_Robot5_pressed():
	var Robot5Info = RobotInfoScreen.instance()
	add_child(Robot5Info)
	Robot5Info.init(playerData.crew[4])

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
	
func _on_ScrapButton5_pressed():
	robot_to_scrap = playerData.crew[4]
	popup()
	
func popup():
	NeonEarnedLabel.text = str("Neon earn : ", 80 * robot_to_scrap.scrapModifier)
	SacrificeLabel.text = str("Sacrifice ", robot_to_scrap.robot_name, " ?")
	PopUp.visible = true

func _on_No_pressed():
	robot_to_scrap = null
	PopUp.visible = false

func _on_Yes_pressed():
	playerData.neonLeft += 80 * robot_to_scrap.scrapModifier
	playerData.remove_robot(robot_to_scrap)
	get_tree().reload_current_scene()


func _on_ButtonEngine_pressed():
	if playerData.carParts["engine"]:
		playerData.carParts["engine"] = false
		playerData.neonLeft += EngineScrapNeon
	else:
		if playerData.neonLeft >= NeonToNextStage + EngineRepairNeon:
			playerData.carParts["engine"] = true
			playerData.neonLeft -= EngineRepairNeon
	get_tree().reload_current_scene()


func _on_ButtonClutch_pressed():
	if playerData.carParts["clutch"]:
		playerData.carParts["clutch"] = false
		playerData.neonLeft += ClutchScrapNeon
	else:
		if playerData.neonLeft > NeonToNextStage + ClutchRepairNeon:
			playerData.carParts["clutch"] = true
			playerData.neonLeft -= ClutchRepairNeon
	get_tree().reload_current_scene()


func _on_ButtonBrake_pressed():
	if playerData.carParts["brake"]:
		playerData.carParts["brake"] = false
		playerData.neonLeft += BrakeScrapNeon
	else:
		if playerData.neonLeft > NeonToNextStage + BrakeRepairNeon:
			playerData.carParts["brake"] = true
			playerData.neonLeft -= BrakeRepairNeon
	get_tree().reload_current_scene()


func _on_ButtonRW_pressed():
	if playerData.carParts["right_wheel"]:
		playerData.carParts["right_wheel"] = false
		playerData.neonLeft += RWScrapNeon
	else:
		if playerData.neonLeft > NeonToNextStage + RWRepairNeon:
			playerData.carParts["right_wheel"] = true
			playerData.neonLeft -= RWRepairNeon
	get_tree().reload_current_scene()


func _on_ButtonLW_pressed():
	if playerData.carParts["left_wheel"]:
		playerData.carParts["left_wheel"] = false
		playerData.neonLeft += LWScrapNeon
	else:
		if playerData.neonLeft > NeonToNextStage + LWRepairNeon:
			playerData.carParts["left_wheel"] = true
			playerData.neonLeft -= LWRepairNeon
	get_tree().reload_current_scene()


func _on_ButtonScrap_pressed():
	if playerData.carHP > 10:
		playerData.carHP -= 10
		playerData.neonLeft += HPScrapNeon
		get_tree().reload_current_scene()


func _on_ButtonRepair_pressed():
	if playerData.neonLeft >= NeonToNextStage + HPRepairNeon and playerData.carHP <= playerData.maxCarHP - 10:
		playerData.neonLeft -= HPRepairNeon
		playerData.carHP += 10
		get_tree().reload_current_scene()
