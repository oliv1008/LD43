extends Control

onready var tie = $MainContainer/tie
onready var choiceLabel = $MainContainer/DialogueContainer/Choice
onready var choice1Button = $MainContainer/DialogueContainer/ChoiceButtonsContainer/Choice1
onready var choice2Button = $MainContainer/DialogueContainer/ChoiceButtonsContainer/Choice2
onready var choice3Button = $MainContainer/DialogueContainer/ChoiceButtonsContainer2/Choice3
onready var choice4Button = $MainContainer/DialogueContainer/ChoiceButtonsContainer2/Choice4

var state = 0

func _ready():
	tie.connect("input_enter", self, "_on_input_enter")
	tie.connect("buff_end", self, "_on_buff_end")
	tie.connect("state_change", self, "_on_state_change")
	tie.connect("enter_break", self, "_on_enter_break")
	tie.connect("resume_break", self, "_on_resume_break")
	tie.connect("tag_buff", self, "_on_tag_buff")

	tie.buff_text("You are hearing Madonna on the radio.\n", 0.03)
	tie.buff_silence(0.5)
	tie.buff_text("One of your travel mate asks you to change the music.\n", 0.03)
	tie.buff_silence(0.5)
	tie.buff_text("What do you do ?\n\n\n\n")
	tie.buff_silence(0.5)
	tie.buff_text("1 : You turn off the radio\n")
	tie.buff_silence(0.5)
	tie.buff_text("2 : You keep the radio on\n")
	tie.buff_silence(0.5)
	tie.buff_text("3 : You beat the robot's ass\n")
	tie.buff_silence(0.5)
	tie.buff_text("4 (Music doc) : The musical doctorant explains why Madonna is a great artist\n ")
	tie.buff_silence(0.5)
	tie.set_state(tie.STATE_OUTPUT)

	
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_input_enter(s):
	print("Input Enter ", s)
	pass

func _on_buff_end():
	if state == 0:
		
		choiceLabel.text = "Your choice ?"
		choice1Button.text = "1"
		choice2Button.text = "2"
		choice3Button.text = "3"
		choice4Button.text = "4"
		choiceLabel.visible = true
		choice1Button.visible = true
		choice2Button.visible = true
		choice3Button.visible = true
		choice4Button.visible = true
		choice4Button.disabled = true
		for i in range (0, playerData.crew_size):
			for j in playerData.crew[i].trait:
				if j == "Music doc":
					choice4Button.disabled = false
					
	if state == 1:
		choice1Button.text = "Next"
		choice1Button.visible = true
		
	state += 1

func _on_state_change(i):
	print("New state: ", i)
	pass

func _on_enter_break():
	print("Enter Break")
	pass

func _on_resume_break():
	print("Resume Break")
	pass

func _on_tag_buff(s):
	print("Tag Buff ", s)
	pass

func _on_Choice1_pressed():
	if state < 2:
		tie.buff_clear()
		tie.buff_text("The music stop.\n", 0.03)
		tie.buff_text("No one is having fun anymore, poor DJ in the back.\n", 0.03)
		tie.buff_text("You lose 10 Neon.\n", 0.03)
		playerData.neonLeft -= 10
		tie.set_state(tie.STATE_OUTPUT)
		choiceLabel.visible = false
		choice1Button.visible = false
		choice2Button.visible = false
		choice3Button.visible = false
		choice4Button.visible = false
	
	if state == 2:
		get_tree().change_scene("res://gestion/ManagementScreen/EventScreen/Event5/Event5.tscn")


func _on_Choice2_pressed():
	tie.buff_clear()
	tie.buff_text("You don't care about their opinion.\n", 0.03)
	tie.buff_text("You're right. Here, take these 40 Neon.\n", 0.03)
	playerData.neonLeft += 40
	tie.set_state(tie.STATE_OUTPUT)
	choiceLabel.visible = false
	choice1Button.visible = false
	choice2Button.visible = false
	choice3Button.visible = false
	choice4Button.visible = false


func _on_Choice3_pressed():
	tie.buff_clear()
	if playerData.crew_size != 0:
		playerData.remove_robot(playerData.crew[0])
		tie.buff_text("The robots is dead and can't help you anymore.\n", 0.03)
		tie.buff_silence(0.5)
		tie.buff_text("You lost one robot, but you made the right decision.\n", 0.03)
		tie.buff_text("He didn't liked Madonna.\n", 0.03)
	else:
		tie.buff_text("You had no robot left.\n", 0.03)
		tie.buff_silence(0.5)
		tie.buff_text("You hit yourself, you dumb shit, losing 20 Neon.\n", 0.03)
		playerData.neonLeft -= 20
		
	tie.set_state(tie.STATE_OUTPUT)
	choiceLabel.visible = false
	choice1Button.visible = false
	choice2Button.visible = false
	choice3Button.visible = false
	choice4Button.visible = false


func _on_Choice4_pressed():
	tie.buff_clear()
	tie.buff_text("The music doctorant calmed everyone.\n", 0.03)
	tie.buff_silence(0.5)
	tie.buff_text("The calm in the car made you earn 40 Neon.\n", 0.03)
	playerData.neonLeft += 40
	tie.set_state(tie.STATE_OUTPUT)
	choiceLabel.visible = false
	choice1Button.visible = false
	choice2Button.visible = false
	choice3Button.visible = false
	choice4Button.visible = false