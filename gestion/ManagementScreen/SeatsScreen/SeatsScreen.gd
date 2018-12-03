extends Control

export (PackedScene) var MainScreen

onready var seatsPortrait = [$Car/Seat1/SeatPortrait1, \
							$Car/Seat2/SeatPortrait2, \
							$Car/Seat3/SeatPortrait3, \
							$Car/Seat4/SeatPortrait4]

onready var robotsPortrait = [$MainContainer/Robot12Container/Robot1Container/Portrait1, \
							$MainContainer/Robot12Container/Robot2Container/Portrait2, \
							$MainContainer/Robot34Container/Robot3Container/Portrait3, \
							$MainContainer/Robot34Container/Robot4Container/Portrait4]
							
onready var robotsDamage = [$MainContainer/Robot12Container/Robot1Container/StatInfoContainer/Damage, \
						$MainContainer/Robot12Container/Robot2Container/StatInfoContainer/Damage, \
						$MainContainer/Robot34Container/Robot3Container/StatInfoContainer/Damage, \
						$MainContainer/Robot34Container/Robot4Container/StatInfoContainer/Damage]

onready var robotsSkill = [$MainContainer/Robot12Container/Robot1Container/StatInfoContainer/Skill, \
						$MainContainer/Robot12Container/Robot2Container/StatInfoContainer/Skill, \
						$MainContainer/Robot34Container/Robot3Container/StatInfoContainer/Skill, \
						$MainContainer/Robot34Container/Robot4Container/StatInfoContainer/Skill]

var robot_selected

func _ready():
	for i in range(0, 4):
		if playerData.seats[i] != null:
			seatsPortrait[i].texture = playerData.crew[playerData.crew.find(playerData.seats[i])].portrait
		
	for i in range(0, playerData.crew_size):
		robotsPortrait[i].texture_normal = playerData.crew[i].portrait
		robotsPortrait[i].visible = true
		robotsDamage[i].text = str("Damage : ", playerData.crew[i].attaque_value)
		robotsDamage[i].visible = true
		robotsSkill[i].text = str("Skill : ", playerData.crew[i].competence)
		robotsSkill[i].visible = true

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to(MainScreen)

func _on_Portrait1_pressed():
	robot_selected = playerData.crew[0]
	$ButtonContainer.visible = true


func _on_Portrait2_pressed():
	robot_selected = playerData.crew[1]
	$ButtonContainer.visible = true


func _on_Portrait3_pressed():
	robot_selected = playerData.crew[2]
	$ButtonContainer.visible = true


func _on_Portrait4_pressed():
	robot_selected = playerData.crew[3]
	$ButtonContainer.visible = true


func _on_Button1_pressed():
	var index_seat_robot_selected = playerData.seats.find(robot_selected)
	if index_seat_robot_selected != -1 and index_seat_robot_selected != 0:
		playerData.seats[index_seat_robot_selected].remove_from_seat()
		seatsPortrait[index_seat_robot_selected].texture = null
		playerData.seats[index_seat_robot_selected] = null
		playerData.seats_size -= 1
	playerData.seats_size += 1
	playerData.seats[0] = robot_selected
	robot_selected.add_to_seat1()
	seatsPortrait[0].texture = robot_selected.portrait
	$ButtonContainer.visible = false


func _on_Button2_pressed():
	var index_seat_robot_selected = playerData.seats.find(robot_selected)
	if index_seat_robot_selected != -1 and index_seat_robot_selected != 1:
		playerData.seats[index_seat_robot_selected].remove_from_seat()
		seatsPortrait[index_seat_robot_selected].texture = null
		playerData.seats[index_seat_robot_selected] = null
		playerData.seats_size -= 1
	playerData.seats_size += 1
	playerData.seats[1] = robot_selected
	robot_selected.add_to_seat2()
	seatsPortrait[1].texture = robot_selected.portrait
	$ButtonContainer.visible = false


func _on_Button3_pressed():
	var index_seat_robot_selected = playerData.seats.find(robot_selected)
	if index_seat_robot_selected != -1 and index_seat_robot_selected != 2:
		playerData.seats[index_seat_robot_selected].remove_from_seat()
		seatsPortrait[index_seat_robot_selected].texture = null
		playerData.seats[index_seat_robot_selected] = null
		playerData.seats_size -= 1
	playerData.seats_size += 1
	playerData.seats[2] = robot_selected
	robot_selected.add_to_seat3()
	seatsPortrait[2].texture = robot_selected.portrait
	$ButtonContainer.visible = false


func _on_Button4_pressed():
	var index_seat_robot_selected = playerData.seats.find(robot_selected)
	if index_seat_robot_selected != -1 and index_seat_robot_selected != 3:
		playerData.seats[index_seat_robot_selected].remove_from_seat()
		seatsPortrait[index_seat_robot_selected].texture = null
		playerData.seats[index_seat_robot_selected] = null
		playerData.seats_size -= 1
	playerData.seats_size += 1
	playerData.seats[3] = robot_selected
	robot_selected.add_to_seat4()
	seatsPortrait[3].texture = robot_selected.portrait
	$ButtonContainer.visible = false
