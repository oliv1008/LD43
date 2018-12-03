extends Control

var PathToTinkerScene = "res://gestion/ManagementScreen/TinkerManagementScreen/TinkerManagementScreen.tscn"
var PathToSeatsScene = "res://gestion/ManagementScreen/SeatsScreen/SeatsScreen.tscn"
var PathToCrewStatusScreen = "res://gestion/ManagementScreen/CrewStatusScreen/CrewStatusScreen.tscn"
var PathToNextLevel

onready var EngineLabel = $VBoxContainer/Car/CarInfoContainer/CarPartsContainer/Engine
onready var BrakeLabel = $VBoxContainer/Car/CarInfoContainer/CarPartsContainer/Brake
onready var ClutchLabel = $VBoxContainer/Car/CarInfoContainer/CarPartsContainer/Clutch
onready var RightWheelLabel = $"VBoxContainer/Car/CarInfoContainer/CarPartsContainer/Right wheel"
onready var LeftWheelLabel = $"VBoxContainer/Car/CarInfoContainer/CarPartsContainer/Left wheel"
onready var CarHPLabel = $VBoxContainer/Car/CarInfoContainer/CarDataContainer/CarHp
onready var FuelLeftLabel = $VBoxContainer/Car/CarInfoContainer/CarDataContainer/FuelLeft
onready var CurrentStageLabel = $VBoxContainer/CurrentStage/VBoxContainer/CurrentStage
onready var FuelRequiredLabel = $VBoxContainer/CurrentStage/VBoxContainer/FuelRequired

func _ready():
	
	if playerData.songName != "MainTheme":
		MusicPlayer.playSong("MainTheme", 0, 1, 57)
	
	if playerData.carParts["engine"]:
		EngineLabel.text = "Engine : OK"
	else:
		EngineLabel.text = "Engine : DEAD"
		
	if playerData.carParts["brake"]:
		BrakeLabel.text = "Brake : OK"
	else:
		BrakeLabel.text = "Brake : DEAD"
		
	if playerData.carParts["clutch"]:
		ClutchLabel.text = "Clutch : OK"
	else:
		ClutchLabel.text = "Clutch : DEAD"
		
	if playerData.carParts["right_wheel"]:
		RightWheelLabel.text = "Right wheel : OK"
	else:
		RightWheelLabel.text = "Right wheel : DEAD"
		
	if playerData.carParts["left_wheel"]:
		LeftWheelLabel.text = "Left wheel : OK"
	else:
		LeftWheelLabel.text = "Left wheel : DEAD"
	
	CarHPLabel.text = str("Car HP : ", playerData.carHP, "/", playerData.maxCarHP)
	FuelLeftLabel.text = str("Neon left : ", playerData.neonLeft)
	CurrentStageLabel.text = str("Stage ", playerData.currentStage, "/5")
	FuelRequiredLabel.text = str("Neon required to reach\nnext stop : ", "XXX")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_Scrap_pressed():
	get_tree().change_scene(PathToTinkerScene)


func _on_Seats_pressed():
	get_tree().change_scene(PathToSeatsScene)


func _on_Crew_pressed():
	get_tree().change_scene(PathToCrewStatusScreen)


func _on_FloorItButton_pressed():
	if playerData.currentStage <= 4:
		PathToNextLevel = str("res://shmup/niveaux/niveau", playerData.currentStage + 1, ".tscn")
		get_tree().change_scene(PathToNextLevel)
	
