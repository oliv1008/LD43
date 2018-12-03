extends Control

export (PackedScene) var RobotInfoScreen
export (PackedScene) var MainScreen

onready var portraits = [$VBoxContainer/HBoxContainer/Portrait1, \
						$VBoxContainer/HBoxContainer/portrait2, \
						$VBoxContainer/HBoxContainer2/Portrait3, \
						$VBoxContainer/HBoxContainer2/Portrait4]

func _ready():
	for i in range(0, playerData.crew_size):
		portraits[i].texture_normal = playerData.crew[i].portrait
		portraits[i].visible = true

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().set_input_as_handled()
		get_tree().change_scene_to(MainScreen)

func _on_Portrait1_pressed():
	var Robot1Info = RobotInfoScreen.instance()
	add_child(Robot1Info)
	Robot1Info.init(playerData.crew[0])


func _on_portrait2_pressed():
	var Robot2Info = RobotInfoScreen.instance()
	add_child(Robot2Info)
	Robot2Info.init(playerData.crew[1])


func _on_Portrait3_pressed():
	var Robot3Info = RobotInfoScreen.instance()
	add_child(Robot3Info)
	Robot3Info.init(playerData.crew[2])


func _on_Portrait4_pressed():
	var Robot4Info = RobotInfoScreen.instance()
	add_child(Robot4Info)
	Robot4Info.init(playerData.crew[3])
